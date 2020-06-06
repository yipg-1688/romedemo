<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <h2>新增新书</h2>
    <form action="/book/add" method="post">
        <table>
            <tr>
                <td> 书名：</td>
                <td><input type="text" name="bookName"></td>
            </tr>
            <tr>
                <td> 作者：</td>
                <td><input type="text" name="bookAuthor"></td>
            </tr>
            <tr>
                <td> 出版社：</td>
                <td><input type="text" name="bookPublish"></td>
            </tr>
            <tr>
                <td> 页数：</td>
                <td><input type="text" name="bookPage"></td>
            </tr>
            <tr>
                <td> 价格：</td>
                <td><input type="text" name="bookPrice"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="提交"></td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript" class="/js/jquery.js"></script>
</body>
</html>
