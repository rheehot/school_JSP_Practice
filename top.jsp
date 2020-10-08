<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        header{
            background-color:#4A0BA3;
            height:90px;
            line-height:90px;
            text-align:center;
            vertical-align:middle;
            color : #FFFFFF;
        }
        nav{
            background-color:#9B7CC9;
            width:100%;
            height:45px; 	 
            display:table;
            text-align:left;
        }
        section{        
            background-color:#FAEBFF;
            height:600px;       
            width :100%;   
        }
        footer{
            background-color:#7C6D93;
            height:50px;
            line-height:25px;
            text-align:center;
        
        }
    </style>
</head>
<body>
<header><h2>[ 학생 정보 관리 ] </h2></header>
 <nav> 
        <span id="span1">
        &emsp; &emsp;<a href=form.jsp>성적입력 </a> &emsp;&emsp;&emsp;
        &emsp;<a href=list.jsp>성적조회 </a> &emsp;&emsp;&emsp;
         &emsp;<a href=index.jsp>홈으로 </a>
        </span>  
    </nav>