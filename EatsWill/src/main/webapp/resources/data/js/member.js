
//Member 클래스 만듬
Member = function(id,name,addr){
	
	this.id =id;
	this.name = name;
	this.addr = addr;
	
}

//클래스 내에 함수 정의(setter)
Member.prototype.setValue = function(id,name,addr){
	
	this.id =id;
	this.name = name;
	this.addr = addr;
	
}

//클래스 내에 함수 정의(getter)
Member.prototype.getValue = function(){
	return "["+this.id+"]" + this.name +"(" +this.addr+")";
}