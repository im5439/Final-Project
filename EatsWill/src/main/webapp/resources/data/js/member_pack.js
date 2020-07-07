
var com = new Object();
com.util = new Object();
com.util.Member = function (id,name,addr){
	this.id = id;
	this.name= name;
	this.addr = addr;
}

com.util.Member.prototype={
		
		setValue:function(id,name,addr){ //전부다 세팅
			this.id = id;
			this.name= name;
			this.addr = addr;
		},
		setId:function(id){ //id하나만 세팅
			this.id = id;
		},
		getValue:function(){ //전부다 가져오기
			return this.id + ":" + this.name + ":" + this.addr;
		},
		getId:function(){ //id만 가져오기
			return this.id;
		},
		toString:function(){
			return this.id + ":" + this.name + ":" + this.addr;
		}
		
}