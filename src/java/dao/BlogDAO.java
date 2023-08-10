/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import dao.DBContext;
import java.sql.Date;
import model.BlogCategory;

/**
 *
 * @author SHD
 */
public class BlogDAO extends DBContext {

    public List<Blog> getListBlogs(String search, String cateId, String sortType, String index) {
        int curIndex = Integer.valueOf(index);
        String orderBy = "order by b.blog_id asc";
        switch (sortType) {
            case "1":
                orderBy = "order by b.title asc";
                break;
            case "2":
                orderBy = "order by b.title desc";
                break;
            case "3":
                orderBy = "order by b.createDate desc";
                break;
        }
        List<Blog> listB = new ArrayList<>();
        String sql = "select * from Blog b join categoryBlog c on b.cate_id = c.categoryBlog_id\n"
                + "  where b.title like '%" + search + "%'  and b.status=1 ";
        if (!cateId.isEmpty()) {
            sql += " and b.cate_id = " + cateId + " ";
        }
        sql += orderBy
                + " OFFSET " + (curIndex - 1) * 9 + " ROWS FETCH NEXT 9  ROWS ONLY";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7));
                b.setCategory(rs.getString(11));
                listB.add(b);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public List<Blog> getTop3ListBlogs() {
        List<Blog> listB = new ArrayList<>();
        String sql = "select top 3 * from Blog b join categoryBlog c on b.cate_id = c.categoryBlog_id\n"
                + "  where b.cate_id = 1 order by createDate desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7));
                b.setCategory(rs.getString(11));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public int countBlogs() {
        String sql = "select count(*) from Blog b join categoryBlog c on b.cate_id = c.categoryBlog_id\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<BlogCategory> getBlogCategories() {
        List<BlogCategory> listB = new ArrayList<>();
        String sql = "  select * from categoryBlog";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BlogCategory b = new BlogCategory(rs.getInt(1),
                        rs.getString(2));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public Blog getDetailBlogs(String bid) {
        String sql = "  select * from Blog b \n"
                + "join categoryBlog c on b.cate_id = c.categoryBlog_id\n"
                + "join [user] u on u.user_id = b.author\n"
                + "  where b.blog_id = " + bid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(17),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7));
                b.setCategory(rs.getString(11));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Blog getDetailBlogsById(String bid) {
        String sql = "  select * from Blog b \n"
                + "  where b.blog_id = " + bid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt("blog_id"));
                b.setTitle(rs.getString("title"));
                b.setAuthor(rs.getString("author"));
                b.setImage(rs.getString("image"));
                b.setBrief_info(rs.getString("brief_infor"));
                b.setBlog_content(rs.getString("blog_content"));
                b.setCate_id(rs.getInt("cate_id"));
                b.setStatus(rs.getBoolean("status"));
                b.setThumbnail(rs.getString("thumbnail"));
                b.setFlag(rs.getString("flag"));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Blog getBlogDetail(String id) {
        String sql = "select * from [Blog]\n"
                + "where blog_id = ?";
        int xId;
        String xThumbnail;
        int xAuthor_id;
        String xTitle;
        int xCategory;
        String xFlag;
        boolean xStatus;
        String xContent;
        Date xCreated;
        Date xModified;
        String xBrief_info;
        Blog x = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                xId = rs.getInt("id");
                xThumbnail = rs.getString("thumbnail");
                xAuthor_id = rs.getInt("author_id");
                xTitle = rs.getString("title");
                xCategory = rs.getInt("category_id");
                xFlag = rs.getString("flag");
                xStatus = rs.getBoolean("status");
                xContent = rs.getString("content");
                xCreated = rs.getDate("created");
                xModified = rs.getDate("modified");
                xBrief_info = rs.getString("brief_info");
                x = new Blog(xId, xTitle, xFlag, xFlag, xBrief_info, xCreated, xContent, xCategory, xStatus, xContent, xThumbnail, xFlag, xModified);
            }
        } catch (Exception e) {
        }
        return x;
    }

    public List<Blog> getBlogList() {
        List<Blog> t = new ArrayList<>();
        String sql = "select * from [Blog]";
        int xId;
        String xThumbnail;
        int xAuthor_id;
        String xTitle;
        int xCategory;
        String xFlag;
        boolean xStatus;
        String xContent;
        Date xCreated;
        Date xModified;
        String xBrief;
        Blog x = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                xId = rs.getInt("blog_id");
                xThumbnail = rs.getString("thumbnail");
                xAuthor_id = rs.getInt("author_id");
                xTitle = rs.getString("title");
                xCategory = rs.getInt("category_id");
                xFlag = rs.getString("flag");
                xStatus = rs.getBoolean("status");
                xContent = rs.getString("content");
                xCreated = rs.getDate("created");
                xModified = rs.getDate("modified");
                xBrief = rs.getString("brief_info");
                x = new Blog(xId, xTitle, xBrief, xFlag, xBrief, xCreated, xContent, xCategory, xStatus, xContent, xThumbnail, xFlag, xModified);
                t.add(x);
            }
        } catch (Exception e) {
        }
        return t;
    }

    public String getAuthor(int id) {
        String sql = "select full_name from [user_profile]\n"
                + "where user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getCategoryName(int id) {
        String sql = "select name from [blog_category]\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Blog> searchPost(String keyword) {
        List<Blog> resultPost = new ArrayList<>();
        String sql = "select * from [blog] where title like ?";
        int xId;
        String xThumbnail;
        int xAuthor_id;
        String xTitle;
        int xCategory;
        String xFlag;
        boolean xStatus;
        String xContent;
        Date xCreated;
        Date xModified;
        String xBrief;
        Blog x = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                xId = rs.getInt("id");
                xThumbnail = rs.getString("thumbnail");
                xAuthor_id = rs.getInt("author_id");
                xTitle = rs.getString("title");
                xCategory = rs.getInt("category_id");
                xFlag = rs.getString("flag");
                xStatus = rs.getBoolean("status");
                xContent = rs.getString("content");
                xCreated = rs.getDate("created");
                xModified = rs.getDate("modified");
                xBrief = rs.getString("brief_info");
                x = new Blog(xId, xTitle, keyword, xFlag, xBrief, xCreated, xContent, xCategory, xStatus, keyword, xThumbnail, xFlag, xModified);
                resultPost.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (resultPost);
    }

    public void updateBlogWithThumbnail(Blog x) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [thumbnail] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[flag] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[brief_info] = ?\n"
                + "      ,[blog_content] = ?\n"
                + "      ,[modified] = GETDATE()\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, x.getThumbnail());
            ps.setString(2, x.getTitle());
            ps.setInt(3, x.getCate_id());
            ps.setString(4, x.getFlag());
            ps.setBoolean(5, x.getStatus());
            ps.setString(6, x.getBrief_info());
            ps.setString(7, x.getBlog_content());
            ps.setInt(8, x.getBlog_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public void updateBlogWithoutThumbnail(Blog x) {
        String sql = "UPDATE [dbo].[blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[flag] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[brief_info] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[modified] = GETDATE()\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, x.getTitle());
            ps.setInt(2, x.getCate_id());
            ps.setString(3, x.getFlag());
            ps.setBoolean(4, x.getStatus());
            ps.setString(5, x.getBrief_info());
            ps.setString(6, x.getBlog_content());
            ps.setInt(7, x.getBlog_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public void updateBlog(Blog x) {
        String sql = "update blog set title = ?, \n"
                + "[image] = ?,\n"
                + "[brief_infor] = ?,\n"
                + "[blog_content] = ?,\n"
                + "[cate_id] = ?,\n"
                + "[status] = ?,\n"
                + "thumbnail = ?,\n"
                + "[flag] = ?,\n"
                + "[dateModified] = GETDATE()\n"
                + "where blog_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, x.getTitle());
            ps.setString(2, x.getImage());
            ps.setString(3, x.getBrief_info());
            ps.setString(4, x.getBlog_content());
            ps.setInt(5, x.getCate_id());
            ps.setBoolean(6, x.isStatus());
            ps.setString(7, x.getThumbnail());
            ps.setString(8, x.getFlag());
            ps.setInt(9, x.getBlog_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public List<Blog> getListBlogsTop3() {
        List<Blog> listB = new ArrayList<>();
        String sql = "select top 2 * from Blog b join categoryBlog c on b.cate_id = c.categoryBlog_id\n"
                + "  order by numberOfAccess desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7));
                b.setCategory(rs.getString(11));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public void incrementNumberOfAccess(String id) {
        try {
            String sql = "update Blog set numberOfAccess = coalesce(numberOfAccess, 0)+1\n"
                    + "where blog_id = " + id;
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
