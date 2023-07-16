package com.fa.demomvc.repository;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.fa.demomvc.entity.Comment;
@Repository
public class CommentRepositoryImpl implements CommentRepository{
    @Autowired
    private SessionFactory sf;
    // lấy dữ liệu tất cả comment
    @Override
    @Transactional
    public String findAllComment(int id) {
        Session session = sf.getCurrentSession();
        String x ="";
         String sql = "SELECT * FROM comment e where parentID = 0 and ProductID ="+id +"  ORDER BY commentID DESC";
            NativeQuery<Comment> nativequeryHql = session.createNativeQuery(sql, Comment.class);
            List<Comment> datas = nativequeryHql.getResultList();
            if (!datas.isEmpty()) {
             for (int i = 0; i<datas.size(); i++) {
                x= x + findAllCommentRely(datas.get(i).getCommentID(),datas.get(i).getContent() , datas.get(i).getAccountID(), 
                        datas.get(i).getCustomername(), datas.get(i).getProductID(), datas.get(i).getCommentID(), datas.get(i).getCreate_Date());
            }}
            return x;
    }
    // thêm comment mới vào db
    @Override
    public long insertComment(Comment com) {
        Session session = sf.getCurrentSession();
         session.save(com);
         String sql = "SELECT TOP 1 * FROM comment e  ORDER BY commentID DESC";
         NativeQuery<Comment> nativequeryHql = session.createNativeQuery(sql, Comment.class);
         List<Comment> datas = nativequeryHql.getResultList();
         long x= datas.get(0).getCommentID();
         return x;
    }
    // xóa comment với đuôi id phía sau
    @Override
    public void deleteComment(Long id) {
        Session session =sf.getCurrentSession();
        Comment com = session.byId(Comment.class).load(id);
            String sql = "select * from comment where  parentID ="+id+"";
             NativeQuery<Comment> nativequeryHql = session.createNativeQuery(sql, Comment.class);
             List<Comment> datas = nativequeryHql.getResultList();
             for(int i=0; i<datas.size();i++) {
                 deleteComment(datas.get(i).getCommentID());
             }
        session.delete(com);
        
    }
    // update comment
    @Override
    public void updateComment(Comment com, Long id) {
        // TODO Auto-generated method stub
        Session session = sf.getCurrentSession();
        Comment com2 = session.byId(Comment.class).load(id);
        com2.setContent(com.getContent());
        session.save(com2);
    }
    // lay comment với thằng con reply
    public String findAllCommentRely(Long id, String content, int accId, String customerName, int proId, long parentId, Date date  ) {
        Session session = sf.getCurrentSession();
         String x = "<div class=\"box_result comment row\">\r\n"
                 + "                            <div class=\"avatar_comment col-md-1 col-sm-1 col-xl-1 col-xxl-1\">\r\n"
                 + "                                <img src=\"/spring-demo/resources/image/logo.png\" alt=\"avatar\" />\r\n"
                 + "                            </div>\r\n"
                 + "                            <div class=\"result_comment col-md-11 col-sm-11 col-xl-11 col-xxl-11\">\r\n"
                 +"                                <div class=\"idUser\" style=\"display: none;\">"+accId+"</div>"
                 + "                                <div class=\"idComment\" style=\"display: none;\">" +id+ "</div>\r\n"
                 + "                                <h4>"+customerName+"</h4>\r\n"
                 + "                                <p class=\"userComment\">"+ content+"</p>\r\n"
                 + "                                <i>"+date+"</i>\r\n"
                 + "                            <div style=\"display: flex;\" class=\"1234\">\r\n"
                 + "                                    <div style=\"margin-right: 10px;\" class=\"sua\"><a href=\"javascript:void(0)\" onclick=\"edit(this)\">\r\n"
                 + "                                            Chỉnh sửa</a></div>\r\n"
                 + "                                    <div class=\"delete\"><a href=\"javascript:void(0)\" onclick=\"deleteCmt(this)\"> Xóa </a>\r\n"
                 + "                                    </div>\r\n"
                 + "                                </div>\r\n"
                 + "                                <div class=\"reply\"><a href=\"javascript:void(0)\" onclick=\"reply(this)\">REPLY</a>\r\n"
                 + "                                </div>\r\n"
                 + "                                <div class=\"replies\">\r\n";
         String sql = "SELECT  * FROM comment e where parentID = "+parentId+" ";
         NativeQuery<Comment> nativequeryHql = session.createNativeQuery(sql, Comment.class);
         List<Comment> datas = nativequeryHql.getResultList();
         if (!datas.isEmpty()) {
         for (int i = 0; i<datas.size(); i++) {
            x= x + findAllCommentRely(datas.get(i).getCommentID(),datas.get(i).getContent() , datas.get(i).getAccountID(),
                    datas.get(i).getCustomername(), datas.get(i).getProductID(), datas.get(i).getCommentID(), datas.get(i).getCreate_Date());
            
        }}
                 x = x +"                                </div>\r\n"
                 + "                            </div>\r\n"
                 + "                        </div>";
        return x;
    }
    @Override
    public int findIdUserComment(Long id) {
        Session session = sf.getCurrentSession();
        String sql = "select * from comment where commentID="+id+"";
         NativeQuery<Comment> nativequeryHql = session.createNativeQuery(sql, Comment.class);
         Comment com = nativequeryHql.getSingleResult();
         int a = com.getAccountID();
        return a;
    }
}