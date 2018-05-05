package com.zrg.ixd.test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

/**
 * 
 * @author Snail
 *
 */
public class MBGtest {
	//D:\Workspaces\Eclipes2018\FlowerStore\src\test\java\com\zrg\ixd\test\MBGtest.java
	//D:\Workspaces\Eclipes2018\FlowerStore\src\main\webapp\WEB-INF\mbg.xml
	public static void main(String[] args) throws Exception{
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
//		File configFile = new File("D:\\Workspaces\\Eclipes2018\\FlowerStore\\src\\main\\webapp\\WEB-INF\\mbg.xml");
		File configFile = new File("src\\main\\webapp\\WEB-INF\\mbg.xml");
		System.out.println(configFile.exists());	
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
				callback, warnings);
		myBatisGenerator.generate(null);
	}
}
