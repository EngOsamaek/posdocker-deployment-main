//orders.js is responsble for adding and removing ui elements and store the order in the localstorage then send
//them through an api POST call to the database.


var pcart = document.querySelector("#pcart");
var ptotal = document.querySelector("#ptotal");


//to keep items in the ui when refresh
function pshoppingCart() {
  var orders = JSON.parse(localStorage.getItem("orders"));
  var total = localStorage.getItem("total");
  var cartsize = orders.length;
  for (let i = 0; i < cartsize; i++) {
    var pcart = document.querySelector("#pcart"),
      ul = document.createElement("li");
    ul.textContent =
      "(" +
      orders[i][3] +
      ")" +
      " " +
      orders[i][1] +
      " " +
      Number(orders[i][2] * orders[i][3]).toFixed(2) +
      "$";
    ul.setAttribute("id", "sidebarui" + i);
    pcart.appendChild(ul);

    var removebtn = document.createElement("button");
    removebtn.textContent = "X";
    removebtn.onclick = function () {
      removePizza(i);
    };
    removebtn.setAttribute("id", "Deletebtn" + i);
    removebtn.setAttribute("class", "btn btn-danger");
    pcart.appendChild(removebtn);

    var incdecbtn = document.createElement("input");
    incdecbtn.setAttribute("type", "number");
    incdecbtn.setAttribute("min", "1");
    incdecbtn.setAttribute("max", "100");
    incdecbtn.setAttribute("value", orders[i][3]);
    incdecbtn.setAttribute("id", "sidebarcounter" + i);
    pcart.appendChild(incdecbtn);

    var editbtn = document.createElement("button");
    editbtn.onclick = function () {
      Editqnt(i);
    };
    editbtn.textContent = "Edit";
    editbtn.setAttribute("class", "btn btn-warning");
    editbtn.setAttribute("id", "editcounter" + i);
    pcart.appendChild(editbtn);
  }
  ptotal.textContent = "Total: " + total + " $";
}
pshoppingCart();



//to remove menu items from the localstorage and the ui
function removePizza(n) {
  removeDisplayedItems();
  var orders = JSON.parse(localStorage.getItem("orders"));
  var total = localStorage.getItem("total");
  total =
    Number(total).toFixed(2) -
    Number(orders[n][2]).toFixed(2) * Number(orders[n][3]).toFixed(2);
  orders.splice(n, 1);
  localStorage.setItem("orders", JSON.stringify(orders));
  localStorage.setItem("total", total);
  pshoppingCart();
}



//To edit the qnt of items in the ui
function Editqnt(n) {
  var qnt = document.getElementById("sidebarcounter" + n).value;
  var orders = JSON.parse(localStorage.getItem("orders"));
  var total = localStorage.getItem("total");
  total =
    Number(total).toFixed(2) -
    Number(orders[n][2]).toFixed(2) * Number(orders[n][3]).toFixed(2);
  total = Number(total) + Number(orders[n][2]) * Number(qnt);
  total = Number(total).toFixed(2);
  orders[n][3] = Number(qnt);
  localStorage.setItem("orders", JSON.stringify(orders));
  localStorage.setItem("total", total);
  removeDisplayedItems();
  pshoppingCart();
}



// function to remove the ui for items
function removeDisplayedItems() {
  var orders = JSON.parse(localStorage.getItem("orders"));
  var cartsize = orders.length;

  for (let i = 0; i < cartsize; i++) {
    if (document.getElementById("Deletebtn" + i)) {
      let myobj = document.getElementById("sidebarui" + i);
      myobj.remove();
      let myobj2 = document.getElementById("Deletebtn" + i);
      myobj2.remove();
      let myobj3 = document.getElementById("sidebarcounter" + i);
      myobj3.remove();
      let myobj4 = document.getElementById("editcounter" + i);
      myobj4.remove();
    }
  }
}




//calling "/api/makeorder" api to add "createdby" & "total" to bills database
function order() {
  var total = localStorage.getItem("total");
  

  if (total != 0) {
      //sending a static name since we don't have sessions.
    var createdby = "Test User";
    var ordersData = {};
    ordersData["total"] = total;
    ordersData["created_by"] = createdby;
    var ur = "/api/makeorder/";
    $.ajax({
      url: ur,
      type: "POST",
      data: ordersData,
      success: function (data) {
        //sendorderDetails();
        sendorderDetails(data.id);
        
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) { 
        swal("Error: " + errorThrown, "Status: " + textStatus, "error");
    },    
    });
  } else {
    swal("Error", "You Didn't Pick any item", "error");
  }
}




function sendorderDetails(id) { 
  var total = localStorage.getItem("total");
  var orders = JSON.parse(localStorage.getItem("orders"));
  var ur = "/api/sendmenuitems/";
  if (total != 0) {
      //sending a static name since we don't have sessions.
    var ordersData = {};
    var billid = id;
    console.log(orders.length);
    if(orders.length > 1 ){
      for(let i=0; i<orders.length; i++){
        var item_name = orders[i][1];
        var qnt = orders[i][3];
        var price = orders[i][2];
        ordersData["bill_id"]=billid;
        ordersData["item_name"]=item_name;
        ordersData["quantity"]=qnt;
        ordersData["price"]=price;
  
        $.ajax({
          url: ur,
          type: "POST",
          data: ordersData,
          success: function (data) {
            console.log(i+': =i');
            console.log(orders.length);
            if(i == orders.length-1){
              removeDisplayedItems();
              total = localStorage.setItem("total", 0);
              localStorage.setItem("orders", JSON.stringify([]));
              ptotal.textContent = "Total: " + 0 + " $";
              swal("Good job!", "Your Order Has Been Received", "success");
            }
    
          },
          error: function(XMLHttpRequest, textStatus, errorThrown) {
            if(i ==orders.length-1){
              swal("Error: " + errorThrown, "Status: " + textStatus, "error");
            }  
        },    
        });
  
      }
    }
    else{
      var item_name = orders[0][1];
      var qnt = orders[0][3];
      var price = orders[0][2];
      ordersData["bill_id"]=billid;
      ordersData["item_name"]=item_name;
      ordersData["quantity"]=qnt;
      ordersData["price"]=price;

      $.ajax({
        url: ur,
        type: "POST",
        data: ordersData,
        success: function (data) {
          removeDisplayedItems();
          total = localStorage.setItem("total", 0);
          localStorage.setItem("orders", JSON.stringify([]));
          ptotal.textContent = "Total: " + 0 + " $";
          swal("Good job!", "Your Order Has Been Received", "success");
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          
            swal("Error: " + errorThrown, "Status: " + textStatus, "error");
            
      },    
      });
    }



    //}
    

  } else {
    swal("Error", "Error send menu_items", "error");
  }
  
}





//adding the items to the ui and localstorage
function addPizza(pid) {
  //get name & get the data
  pizzaId = "#piz" + pid;
  var name = document.querySelector(pizzaId).innerHTML;
  //get price & get the data
  pizzaprice = "#price" + pid;
  var price = document.querySelector(pizzaprice).innerHTML;
  //get quan & get the data
  qntid = "#qnt" + pid;
  var qnt = document.querySelector(qntid).value;
  var id = pid;
  //getting data from localstorage
  var orders = JSON.parse(localStorage.getItem("orders"));
  var total = localStorage.getItem("total");
  //getting the length of the data
  var cartSize = orders.length;

  //saving in localstorage
  orders[cartSize] = [id,name, price, qnt];

  //qnt logic ---
  if (cartSize != 0) {
    for (let k = 0; k < cartSize; k++) {
      if (orders[k][0] == orders[cartSize][0]) {
        orders[k][3] = Number(orders[k][3]) + Number(qnt);
        orders.pop();
        cartSize = orders.length - 1;
      }
    }
  }

  total = Number(total) + Number(price) * Number(qnt);
  total = Number(total).toFixed(2);
  ptotal.textContent = "Total: " + total + " $";
  localStorage.setItem("total", total);
  localStorage.setItem("orders", JSON.stringify(orders));

  //reseting the counter to 1
  document.getElementById("qnt" + pid).value = "1";


  removeDisplayedItems();
  pshoppingCart();
}