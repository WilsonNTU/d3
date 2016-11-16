function linetest() {
var width = 1024;
var height = 768;
var ctrl = d3.select("body").append("svg").attr("width", width).attr("height", height);
d3.csv("https://wilsonntu.github.io/d3/goog.csv", 
	function(data)
	{
		var ln = data.length;
		console.log(data);
		var maxy = d3.max(data, function(d){ return d.Adjusted; });
		var lines = d3.line().x(function(d,i){return i*(width/ln);}).y(function(d){return height-d.Adjusted*(height/maxy)});
		ctrl.append("path").attr("d", function(d){
			return "M0,"+height+"L"+width+","+height;
		}).attr("stroke", "black").attr("fill", "none");
		ctrl.append("path").attr("d", function(d){
			return "M0,0"+"L0,"+height;
		}).attr("stroke", "black").attr("fill", "none");
		ctrl.append("path").data([data]).attr("d", lines).attr("stroke", "red").attr("fill", "none");
		y.domain([0, maxy]);
		ctrl.append("g")
      	.attr("transform", "translate(0," + height + ")")
      	.call(d3.axisBottom(x));
  		ctrl.append("g")
      	.call(d3.axisLeft(y));
	}

);
}
