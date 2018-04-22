package com.Lwoo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Lwoo.service.UserService;
import com.Lwoo.util.ViewExcel;

@Controller
@RequestMapping("")
public class ExportController {
	@Autowired
	UserService userService;
	/** 
     * 导出excel2 
     *  
     * @param map 
     * @return 
     * @throws Exception 
     */  
    @RequestMapping("/export")  
    public ModelAndView export(ModelMap map,int tid) throws Exception {
    	System.out.println(tid);
        List<Map<String, String>> list = userService.exportExcelInfo(tid);  
        String[] titles = { "ID", "学号", "姓名", "性别", "Email", "所属社团","会员状态" };  
        ViewExcel excel = new ViewExcel(titles);  
        map.put("excelList", list);  
        return new ModelAndView(excel, map);  
    } 
}
