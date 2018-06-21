package org.zerock.utils;

import java.io.IOException;
import java.util.ArrayList;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import org.zerock.domain.MovieVO;


import lombok.Data;
import lombok.extern.log4j.Log4j;

<<<<<<< HEAD

@Log4j
@Data
public class JavaWebCrawler {
	
	public static List<MovieVO> goCrawling(String address) throws IOException {
		Document doc2 = Jsoup.connect(address).get();
		Elements poster = doc2.body().getElementsByClass("info_movie");
		Elements title = doc2.body().getElementsByClass("info_tit");
		Elements grade = doc2.body().getElementsByClass("info_grade");
		Elements state = doc2.body().getElementsByClass("info_state");

		List<MovieVO> movieList = new ArrayList<>();

		for (int i = 0; i < poster.size(); i++) {
			MovieVO vo = new MovieVO();
			vo.setImage(poster.eq(i).select("img").attr("src"));
			vo.setTitle(title.eq(i).select("a").text());
			vo.setGrade(
					grade.eq(i).select(".grade_netizen").select(".num_grade").text().replaceAll("^0|\\s0|\\s", ""));
			String[] foo = state.eq(i).text().split("・");
			vo.setOpenDate(foo[0]);
			movieList.add(vo);
			
			/*
			System.out.println("img..........................: " + poster.eq(i).select("img").attr("src"));
			System.out.println("title.......: " + title.eq(i).select("a").text());
			System.out.println("grade......: "
					+ grade.eq(i).select(".grade_netizen").select(".num_grade").text().replaceAll("^0|\\s0|\\s", ""));
			System.out.println("state..........................: " + state.eq(i).text().replace("・", "/"));
			System.out.println("poster size : " + poster.size());
			System.out.println("info size : " + title.size());
			*/
		}
		return movieList;

	}
=======
public class JavaWebCrawler {
	
//	public static List<MovieVO> goCrawling(String address) throws IOException {
//		Document doc2 = Jsoup.connect(address).get();
//		Elements poster = doc2.body().getElementsByClass("info_movie");
//		Elements title = doc2.body().getElementsByClass("info_tit");
//		Elements grade = doc2.body().getElementsByClass("info_grade");
//		Elements state = doc2.body().getElementsByClass("info_state");
//
//		List<MovieVO> movieList = new ArrayList<>();
//
//		for (int i = 0; i < poster.size(); i++) {
//			MovieVO vo = new MovieVO();
//			vo.setImage(poster.eq(i).select("img").attr("src"));
//			vo.setTitle(title.eq(i).select("a").text());
//			vo.setGrade(
//					grade.eq(i).select(".grade_netizen").select(".num_grade").text().replaceAll("^0|\\s0|\\s", ""));
//			String[] foo = state.eq(i).text().split("・");
//			vo.setOpenDate(foo[0]);
//			movieList.add(vo);
//			
//			
//			System.out.println("img..........................: " + poster.eq(i).select("img").attr("src"));
//			System.out.println("title.......: " + title.eq(i).select("a").text());
//			System.out.println("grade......: "
//					+ grade.eq(i).select(".grade_netizen").select(".num_grade").text().replaceAll("^0|\\s0|\\s", ""));
//			System.out.println("state..........................: " + state.eq(i).text().replace("・", "/"));
//			System.out.println("poster size : " + poster.size());
//			System.out.println("info size : " + title.size());
//			
//		}
//		return movieList;
//	}
>>>>>>> 9afac61dfdacacaa332e0ce28afdec8a4a2cfce2
}
