package com.fa.demomvc.repository;



import java.sql.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Repository;
import com.fa.demomvc.entity.Comment;
public interface CommentRepository {
   public String findAllComment(int id);
    public long insertComment(Comment com);
    public void deleteComment(Long id);
    public void updateComment(Comment com, Long id);
    //public String findAllCommentRely(Long id, String content, int accId, String customerName, int proId, int parentId, Date date );
    public int findIdUserComment(Long id);
}