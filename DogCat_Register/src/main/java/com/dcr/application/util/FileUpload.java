package com.dcr.application.util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Component
public class FileUpload {

	public String fileUpload(HttpServletRequest request) {
		JSONObject obj = new JSONObject();
		int size = 1024 * 1024 * 5; // 5M 제한
		String file = "";
		String oriFile = "";
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/images/").toPath().toString();
			System.out.println(path);
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();
			
			file = multi.getFilesystemName(str);
			oriFile = multi.getOriginalFileName(str);
			
			obj.put("success", new Integer(1));
			obj.put("desc","업로드 성공");
			obj.put("src","/upload/images/"+file);

			System.out.println("=====");
			System.out.println("업로드 성공");
			System.out.println("=====");
		}catch(Exception e) {
			e.printStackTrace();
			obj.put("success", new Integer(0));
			obj.put("desc", "업로드 실패");
		}

		return obj.toJSONString();
		
	}
	
}
