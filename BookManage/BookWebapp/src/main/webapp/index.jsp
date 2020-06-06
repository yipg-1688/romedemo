<%@ page import="cn.lg.beans.Book" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'find.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<div align="center">
    <form action="/book/books" method="get">
        <select name="param">
            <option value="bookName">书名</option>
            <option value="bookAuthor">作者</option>
            <option value="bookPublish">出版社</option>
            <option value="bookPage">页数</option>
            <option value="bookPrice">价格</option>
        </select>
        <input name="paramValue" type="text">
        <input type="submit" value="提交">
    </form>
    <h4>${msg}</h4>
    <a href="/book/add" style="color: blue">新增新书</a>
    <table border="1">
        <tbody>
        <c:forEach items="${books}" var="book" varStatus="stat">
            <tr>
                <td>${book.bookName}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookPublish}</td>
                <td>${book.bookPage}</td>
                <td>${book.bookPrice}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/book/books?pageIndex=1">首页</a>
    <a href="/book/books?pageIndex=<c:if test='pageIndex>1'>${pageIndex-1}</c:if><c:if test='pageIndex<2'>${pageIndex}</c:if>">上一页</a>
    <a href="/book/books?pageIndex=${pageIndex+1}">下一页</a>
    <a href="/book/books?pageIndex=${totalPage}">尾页</a>
</div>
</body>
<script type="text/javascript" src="/js/jquery.js"></script>
<script>
    $("h4").fadeOut(5000);
</script>

</html>
