defineClass('HomeViewController', {
    viewWillAppear: function(animated) {
        self.super().viewWillAppear(animated);
            var str = "test";
            console.log(str);
            console.log("123");
    },
    viewWillDisappear: function(animated) {
        self.super().viewWillDisappear(animated);
            //balabala...
    },
});
