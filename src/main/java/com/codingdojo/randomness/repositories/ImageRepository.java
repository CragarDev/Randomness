package com.codingdojo.randomness.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.randomness.models.Image;
import com.codingdojo.randomness.models.User;

@Repository
public interface ImageRepository extends CrudRepository<Image, Long> {
	
	List<Image> findAll();
	
    Optional<Image> findById(Long id);

    Image findByUrl(String url);

}
