<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約一覧画面</title>
<link rel="stylesheet" href="tab.css">
</head>
<body>
	<h1>テレワーク部屋予約一覧</h1>

	
	<div class="tab-wrap">
	    <input id="TAB-01" type="radio" name="TAB" class="tab-switch" checked="checked" /><label class="tab-label" for="TAB-01">未承認</label>
	    <div class="tab-content">
	        日付(こんなイメージ）
			<br>
			部屋番号
			<br>
			日付
			<br>
			部屋番号
			
	    </div>
	    <input id="TAB-02" type="radio" name="TAB" class="tab-switch" /><label class="tab-label" for="TAB-02">承認済み</label>
	    <div class="tab-content">
	        
		<p>
		日付(承認された日付が記載されるイメージ)
		</p>
		
		<p>
		部屋番号	
		</p>
	    </div>
	    
	</div>

	
	
	<a href ="index3.html" class="btn">戻る</a>
	
	
	
	<p>
	<a href ="Top画面.html" class="btn">ログアウト</a>
	</p>
		
</body>
</html>