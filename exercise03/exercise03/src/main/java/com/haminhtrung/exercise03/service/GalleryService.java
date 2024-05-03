package com.haminhtrung.exercise03.service;

import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.haminhtrung.exercise03.entity.Category;
import com.haminhtrung.exercise03.entity.Gallery;

public interface GalleryService {
    Gallery saveImage(UUID productId, MultipartFile file,int i);
        Gallery getGalleryById(UUID galleryId);
        
        List<Gallery> getAllGalleries();

    List<Gallery> saveImages(UUID productId, MultipartFile[] files);
    List<Gallery> getImagesByProductId(UUID productId);
    void deleteGalleryByProductId(UUID productId);
    void update(UUID productId, MultipartFile[] newFiles);
}
