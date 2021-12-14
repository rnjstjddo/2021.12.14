var cart = (function(){
	
	
	
	
	
	return {
		add : add
	}
	
//	// 댓글 등록(자동)
//	function add(reply, callback, error){
//	
//		$.ajax({
//			type : 'post',
//			url : '/replies/new',
//			data : JSON.stringify(reply),
//			contentType : "application/json; charset = UTF-8",
//			success : function(result, status, xhr){
//				if(callback){
//					callback(result);
//				}
//			},
//			error : function(xhr, status, er){
//				if(error){
//					error(er);
//				}
//			}
//		})
//		
//	}
//
//	// 해당 bno의 댓글 조회
//	function getList(param, callback, error){
//		
//		var bno = param.bno;
//		var page = param.page || 1;
//		
//		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
//				function(data){
//					if (callback){
//						callback(data.replyCnt, data.list);
//					}
//			}).fail(function(xhr, status, err){
//				if (error) {
//					error();
//				}
//			});
//	}
//	
//	
//	// 댓글 삭제
//	function remove(rno, callback, error){
//		$.ajax({
//			type : 'delete',
//			url : '/replies/' + rno,
//			data: JSON.stringify({rno:rno, replyer:replyer}),
//			contentType: "application/json; charset=utf-8",
//			success : function(deleteResult, status, xhr){
//				if (callback){
//					callback(deleteResult);
//				}
//			},
//			error : function(xhr, status, er){
//				if (error){
//					error(er);
//				}
//			}
//		});
//	}
//	
//	// 수정
//	function update(reply, callback, error){
//		
//		$.ajax({
//			type : 'put',
//			url : '/replies/' + reply.rno,
//			data : JSON.stringify(reply),
//			contentType : "application/json; charset = UTF-8",
//			success : function(result, status, xhr){
//				if (callback){
//					callback(result);
//				}
//			},
//			error : function(xhr, status, er){
//				if (error){
//					error(er);
//				}
//			}
//		});
//	}
//	
//	
//	function get(rno, callback, error){
//		$.get("/replies/" + rno + ".json", function(result){
//			if (callback){
//				callback(result);
//			}
//		}).fail(function(xhr, status, er){
//			if (error){
//				error();
//			}
//		});
//	}
//	
//	
//	// Page 417 시간에 대한 처리
//	function displayTime(timeValue){
//		var today = new Date();
//		var gap = today.getTime() - timeValue;
//		var dateObj = new Date(timeValue);
//		var str = "";
//		
//		if (gap < (1000 * 60 * 60 * 24)){
//			var hh = dateObj.getHours();
//			var mi = dateObj.getMinutes();
//			var ss = dateObj.getSeconds();
//			
//			return [ (hh > 9 ? ' ' : '0') + hh, '시  ', (mi > 9 ? ' ' : '0') + mi, '분  ', (ss > 9 ? ' ' : '0') + ss, '초  ' ].join(' ');
//		}
//		else{
//			var yy = dateObj.getFullYear();
//			var mm = dateObj.getMonth() + 1;
//			var dd = dateObj.getDate();
//			
//			return [ yy, ' 년 ' , (mm > 9 ? ' ' : '0') + mm, ' 월 ' , (dd > 9 ? ' ' : '0') + dd, ' 일 ' ].join(' ');
//		}
//		
//	}
//		
//	return {
//		add : add,
//		getList : getList,
//		remove : remove,
//		update : update,
//		get : get,
//		displayTime : displayTime
//	};
	
})();