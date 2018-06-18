package org.zerock.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import lombok.Data;

@Data
public class JavaWebCrawler {

	private String image;
	private String title;
	private String grade;
	private String state;
	



	public static List<JavaWebCrawler> goCrawling(String address) throws IOException {
			
	        Document doc2 = Jsoup.connect(address).get();
	        Elements poster = doc2.body().getElementsByClass("info_movie");
	        Elements title = doc2.body().getElementsByClass("info_tit");
	        Elements grade = doc2.body().getElementsByClass("info_grade");
	        Elements state = doc2.body().getElementsByClass("info_state");
	        List<JavaWebCrawler> movieList = new ArrayList<>();
	        for(int i=0; i<poster.size(); i++){

	            System.out.println("img..........................: "+poster.eq(i).select("img").attr("src"));
	            System.out.println("title.......: "+title.eq(i).select("a").text());
	            System.out.println("grade......: " + grade.eq(i).select(".grade_netizen").select(".num_grade").text().replaceAll("^0|\\s0|\\s", ""));
	            System.out.println("state..........................: " + state.eq(i).text().replace("・", "/"));
	            System.out.println("poster size : "+poster.size());
	            System.out.println("info size : "+ title.size());
	            JavaWebCrawler movieInfo = new JavaWebCrawler();
	            movieInfo.setImage(poster.eq(i).select("img").attr("src"));
	            movieInfo.setTitle(title.eq(i).select("a").text());
	            movieInfo.setGrade(grade.eq(i).select(".grade_netizen").select(".num_grade").text().replaceAll("^0|\\s0|\\s", ""));
	            movieInfo.setState(state.eq(i).text().replace("・", "/"));
	            movieList.add(movieInfo);
	        }
	        
	        return movieList;
	}

}
