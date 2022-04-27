package com.codingdojo.randomness.services;

import com.codingdojo.randomness.repositories.ImageRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {
	
	// Inject Repositories
	@Autowired
	private ImageRepository imageRepo;
}
