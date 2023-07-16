package com.fa.demomvc.service;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import com.fa.demomvc.entity.Comment;
public interface CommentService {
 public String findAllComment(int id);
    void deleteComment(Long id);
    void updateComment(Comment com, Long id);
    public long insertComment(Comment comment);
    public int findIdUserComment(Long id);
}