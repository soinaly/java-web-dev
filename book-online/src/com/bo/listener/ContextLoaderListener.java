package com.bo.listener;

import com.bo.entity.Book;
import com.bo.entity.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author wenjie_lin
 * @ClassName ContextLoaderListener
 * @Description 上下文加载监听，在服务器启动的时候即刻生效，用来生成用户数据和图书数据
 * @Data 2019/10/2
 * @Version 1.0
 **/

@WebListener
public class ContextLoaderListener implements ServletContextListener {
    /**
     * @param sce
     * @Description 容器初始化方法
     * */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("容器启动");
        //创建并生成用户数据列表
        List<User> userList = new ArrayList<>(3);
        User[] users = {
                new User(1,"aaa@qq.com","698d51a19d8a121ce581499d7b701668","吃虫虫的小怪兽","user1.jpg","江苏南京", LocalDate.of(2018,6,11)),
                new User(2,"bbb@qq.com","698d51a19d8a121ce581499d7b701668","小可爱","user2.jpg","浙江杭州", LocalDate.of(2019,2,18)),
                new User(3,"ccc@qq.com","698d51a19d8a121ce581499d7b701668","23号蛋糕","user3.jpg","福建厦门", LocalDate.of(2019,8,19)),

        };
        userList = Arrays.asList(users);
        //创建并生成图书数据列表
        List<Book> bookList = new ArrayList<>(10);
        Book[] books = {
                new Book(1,"漫长的婚约","book1.jpg","[法] 塞巴斯蒂安"),
                new Book(2,"庸人自扰","book2.jpg","[英] 戴论·麦加维"),
                new Book(3,"绿山墙的安妮","book3.jpg","[美] 理查德·耶茨"),
                new Book(4,"敌人与邻居","book4.jpg","[英] 伊恩·布莱克"),
                new Book(5,"哀伤纪","book5.jpg","钟晓阳"),
                new Book(6,"暗店街","book6.jpg","[法] 帕特里克·莫迪亚诺"),
                new Book(7,"世界尽头与冷酷仙境","book7.jpg","[日] 村上春树"),
                new Book(8,"失明症漫记","book8.jpg","[葡] 若泽·萨拉马戈"),
                new Book(9,"局外人","book9.jpg","【法】阿尔贝·加缪"),
                new Book(10,"百年孤独 ","book10.jpg","【西】加夫列尔·加西亚·马尔克斯"),
                new Book(11,"解忧杂货店","book11.jpg","[日] 东野奎吾"),
                new Book(12,"心是孤独的猎手","book12.jpg"," [美] 卡森·麦卡勒斯"),
        };
        bookList = Arrays.asList(books);

        //获得全局变量
        ServletContext servletContext = sce.getServletContext();
        //设置全局变量属性，将用户和图书列表数据记入，整个应用可以共享
        servletContext.setAttribute("userList",userList);
        servletContext.setAttribute("bookList",bookList);
    }

    /**
     * 销毁方法
     *
     * @param sce
     */

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("容器销毁");
    }
}
