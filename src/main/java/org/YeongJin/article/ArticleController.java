package org.YeongJin.article;

import java.util.List;

import org.YeongJin.book.chap11.Member;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class ArticleController {

	@Autowired
	ArticleDao articleDao;
	
	Logger logger = LogManager.getLogger();

	
	@GetMapping("/article/list")
	public void articleList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		
		final int COUNT = 100;
		int offset = (page - 1) * COUNT;

		List<Article> articleList = articleDao.listArticles(offset, COUNT);
		int totalCount = articleDao.getArticlesCount();
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("articleList", articleList);
	}

	
	@GetMapping("/article/view")
	public void articleView(@RequestParam("articleId") String articleId,
			Model model) {
		Article article = articleDao.getArticle(articleId);
		model.addAttribute("article", article);
		
	}

	/*
	@GetMapping("/article/addForm")
	public String articleAddForm(HttpSession session) {
		Object memberObj = session.getAttribute("MEMBER");
		if (memberObj == null)
			return "login/loginForm";
		return "article/addForm";
	}
	*/

	/*
	@PostMapping("/article/add")
	public String articleAdd(Article article, HttpSession session) {
		Object memberObj = session.getAttribute("MEMBER");
		if (memberObj == null)
			return "login/loginForm";
		Member member = (Member) memberObj;
		article.setUserId(member.getMemberId());
		article.setName(member.getName());
		articleDao.addArticle(article);
		return "redirect:/app/article/list";
	}
	*/
	
	@GetMapping("/article/addForm")
	public String articleAddForm(@SessionAttribute("MEMBER") Member member) {
		return "article/addForm";
	}
	
	@PostMapping("/article/add")
	public String articleAdd(Article article, @SessionAttribute("MEMBER") Member member) {
		article.setUserId(member.getMemberId());
		article.setName(member.getName());
		articleDao.addArticle(article);
		return "redirect:/app/article/list";
	}
	
	@PostMapping("/article/delete")
	public String articleDel(String articleId, @SessionAttribute("MEMBER") Member member) {
		if(!articleId.equals(member.getMemberId()))
		return "redirect:/app/article/view";
		else articleDao.deleteArticle(articleId);
		return "redirect:/app/article/delete";
	}
	
	@PostMapping("/article/update")
	public String articleUpdate(Article article, @SessionAttribute("MEMBER") Member member) {
		if(!article.getUserId().equals(member.getMemberId()))
			return "redirect:/app/article/view";
		else articleDao.updateArticle(article);
			return "redirect:/app/article/update";
	}
	
}

