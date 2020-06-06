package cn.lg.dao;


import cn.lg.beans.Book;

import java.util.Collection;
import java.util.Map;

public interface BookDao {
    public Collection<Book> getBooks(Map<String, Object> map);

    public Integer addBook(Book book);

    public Integer total();
}
