package com.fa.demomvc.service;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fa.demomvc.entity.Comment;
import com.fa.demomvc.repository.CommentRepository;
@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    public CommentRepository commentRepository;
    // list tất cả cômment
    @Override
    @Transactional
    public String findAllComment(int id){
        return commentRepository.findAllComment( id);
    }
    // xóa comment 
    @Override
    public void deleteComment(Long id) {
        // TODO Auto-generated method stub
        commentRepository.deleteComment(id);;
    }
    //update comment
    @Override
    @Transactional
    public void updateComment(Comment com, Long id) {
        // TODO Auto-generated method stub
        commentRepository.updateComment(com, id);;
    }
    // thêm comment
    @Override
    @Transactional
    public long insertComment(Comment comment) {
         return commentRepository.insertComment(comment);
    }
    @Override
    @Transactional
    public int findIdUserComment(Long id) {
        
        return commentRepository.findIdUserComment(id);
    }
}