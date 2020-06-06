package cn.lg.controller;

import cn.lg.beans.Book;
import cn.lg.dao.BookDao;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequestMapping(value = "/book")
@Controller
public class BookController {
    @Autowired
    private BookDao bookDao;

    @RequestMapping(value = "/books")
    public String books(@RequestParam(required = false) String pageIndex,
                        @RequestParam(required = false) String param,
                        @RequestParam(required = false) String paramValue, Map<String, Object> map) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pageSize", 4);
        if (!StringUtils.isNullOrEmpty(pageIndex)) {
            params.put("pageIndex", (Integer.parseInt(pageIndex) - 1) * (int) params.get("pageSize"));
        } else {
            params.put("pageIndex", 0);
        }

        if (!StringUtils.isNullOrEmpty(param) && !StringUtils.isNullOrEmpty(paramValue)) {
            params.put(param, paramValue);
        }
        map.put("books", bookDao.getBooks(params));
        map.put("pageIndex", pageIndex);
        map.put("totalPage", bookDao.total() / (int) params.get("pageSize"));
        return "index";
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Book book, Map<String, Object> map) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        book.setCreateDate(timestamp);
        if (bookDao.addBook(book) > 0) {
            map.put("msg", "新增成功");
        } else {
            map.put("msg", "新增失败");
        }
        return "forward:/book/books";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "redirect:/add.jsp";
    }


}
