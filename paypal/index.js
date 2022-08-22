// Buttons(): here i pass arguments to change some properties of this button

paypal
    .Buttons({
        // specify style to this btn
        style: {
            // color: "blue",
            // shape: "pill",
        },

        // implement order function. this function sets up the details of the transaction including the amount and line item details. we specify the amount and execute this transaction
        createOrder: function(data, actions) {
            return actions.order.create({
                // to this create, we pass the product details
                purchase_units: [{
                    //object:amount
                    amount: {
                        // the value of my product
                        value: "0.1",
                    },
                }, ],
            });
        },
        // implement the onapplication function, which is called, after the buyers approve the transaction on paypal. this function captured the fund from the transaction
        onApprove: function(data, actions) {
            // actions.order.capture(): to understand it we have to check it in the paypal api
            return actions.order.capture().then(function(details) {
                // now go to https://developer.paypal.com/developer/accounts,then go to accunts, get the personal account. then open console to see the obj
                console.log(details);
                // redirect the user to different page when the payment is sucessfully document. create success.php file and oncancel.php
                window.location.replace(
                    // pass the url of the success.php page
                    // "http://localhost:63342/FSWD16-TEAM1/paypal/success.php"
                    "http://localhost/Backend/Final%20Project/FSWD16-team1/paypal/success.php"
                );
            });
        },
        // if the user cancel the payment:
        onCancel: function(data) {
            window.location.replace(
                "http://localhost/Backend/Final%20Project/FSWD16-team1/paypal/oncancel.php"
            );
        },
    })
    .render("#paypal-payment-button");