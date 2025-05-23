package com.example.Image.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Image.Entity.MainEntity;

public interface MainRepo extends JpaRepository<MainEntity,Integer> {

	public MainEntity findByUsernameAndPassword(String username, String password);

}
