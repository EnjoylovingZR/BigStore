package com.RuoLiang;

import java.util.List;

public class Test {
    public static void main(String[] args) {
       /* UserSignup userSignup = new UserSignup();
        userSignup.SignUp("123","123","123");

        if (userSignup.getFlag()==1)
            System.out.println("成功！");
        else
            System.out.println("失败！");
    }*/
    /*    UserSignin userSignin = new UserSignin();
        userSignin.SignIn("123@123.com", "123456");

        if (userSignin.getFlag()==1)
            System.out.println("成功！");
        else
            System.out.println("失败！");
*/

/*        GetGood getGood = new GetGood();
        List<Good> list = getGood.GetIt();*/

/*
        AddCar addCar = new AddCar();
        addCar.Add("123@123.com",1,10,0);
*/

        /*GetCar getCar = new GetCar();
        List<Car> list = getCar.GetIt("ruoliangty@gmail.com");
        for (Car car :list){
            System.out.println(car.getOGID()+" "+car.getOUEmail());
        }
*/
       /* ChangeOrderStatus changeOrderStatus = new ChangeOrderStatus();
        changeOrderStatus.changeIt("ruoliangty@gmail.com",15);*/

        ChangeGoodNum changeGoodNum = new ChangeGoodNum();
        changeGoodNum.changeNum();


    }
}
