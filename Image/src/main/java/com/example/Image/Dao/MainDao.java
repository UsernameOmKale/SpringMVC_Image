package com.example.Image.Dao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.Image.Entity.MainEntity;
import com.example.Image.Repo.MainRepo;

@Repository
public class MainDao {
	
	@Autowired
	MainRepo mainRepo;

	public MainEntity saveData(MainEntity mainEntity, MultipartFile imageFile) throws IOException {
     String uploadDir = System.getProperty("user.dir")+"/uploads/image/";
     // this is the path where we are saving the physical image its need to similer with the resource handalar line 
     //.addResourceLocations("file:" + System.getProperty("user.dir") + "/uploads/image/");
     
     
     Path path = Paths.get(uploadDir);//checking your current project path to create folder 
     createDirectoriesIfNotExists(path);
     // this both lines are checking the folder path and if the folder path is not existing then create that 
     
     if((imageFile != null && !imageFile.isEmpty())) {
      mainEntity.setImage(saveFile(imageFile, path));   	 
     } 
     
	return mainRepo.save(mainEntity);	
	}
	
	private void createDirectoriesIfNotExists(Path path) throws IOException {
		if (!Files.exists(path)) {
			Files.createDirectories(path);
		}
		// this method creating actual folder to save photo in your current project 
	}
	
	
	//helper method to manage file name and unwanted char and space
	private String saveFile(MultipartFile imageFile, Path path) throws IOException {
		
		
		String fileName = imageFile.getOriginalFilename();
		String sanitizedFileName = fileName.replaceAll("\\s+", "_");
		//this both line can checking space in original file name and replacing that space with '_'
		
		
		Path filePath = path.resolve(sanitizedFileName);
		Files.write(filePath, imageFile.getBytes());
		
		
		
		return "/uploads/image/" + sanitizedFileName;
		//its returning the path os stored image from database this path must be same which is accessing on html 
	}

	public MainEntity login(String username, String password) {
  return mainRepo.findByUsernameAndPassword(username,password);	
	}


}
