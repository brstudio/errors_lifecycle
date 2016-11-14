
function find(array, value) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] == value) return i;
  }
  return -1;
}

function changeStatus(f){
	var stats = ["new", "opened", "solved", "closed"];
	var element = document.getElementById("fld_statusX");
	var p = find(stats, element.value);	
	if (f == 0){//prev status
		if (p != 0){
			element.value = stats[--p];
		}
	} else{//f == 1 next status
		if (p != 3){
			element.value = stats[++p];
		}
	}
}