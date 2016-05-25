require('UIView, UIColor, UILabel,UIImageView')

//多方法调用，用” ,  ”隔开
defineClass('HomeViewController', {
    viewWillAppear: function(animated) {
        self.super().viewWillAppear(animated);
        var str = "view will appear";
        console.log(str);
        
    },
            
    viewWillDisappear: function(animated) {
        self.super().viewWillDisappear(animated);
            console.log("view will disappear");
    },
            
    //UI相关
    creatView: function() {
            console.log("123");
            var view = UIView.alloc().initWithFrame({x:20, y:20, width:100, height:100});
            view.setBackgroundColor(UIColor.greenColor());
            var label = UILabel.alloc().initWithFrame({x:0, y:0, width:100, height:100});
            label.setText("JSPatch");
            label.setTextAlignment(1);
            view.addSubview(label);
            self.view().addSubview(view)
    }
});


