function goFilter(){
  var wTable = document.getElementById("sampleTable");
  var wSelect = document.getElementById("sampleSelect");
  var value  = wSelect.options[wSelect.selectedIndex].value;
  var cells = table.querySelectorAll('td');
  cells.forEach( (cell) =>  console.log(cell.innerHTML));
  if(value == 'all'){
    // --- 全ての場合はクラスをクリア ---
    wTable.className = '';
  }else{
    // --- タイトル以外のTRを非表示＋指定属性を持つTRのみ表示 ---
    wTable.cell = 'allNoDisplay' + value;
  }
}