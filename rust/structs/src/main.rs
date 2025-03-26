struct User{
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}

fn build_user(email: String, username: String) -> User{
    User{
        active: true, email, username, sign_in_count: 1
    }
}

#[derive(Debug)]
struct Rectangle{
    width: u32,
    height: u32,
}

impl Rectangle{
    fn idle(self: &Self){
        println!("{:?}", self);
    }
    fn area(&self) -> u32{
        self.width * self.height
    }
}

fn main() {
    let user1 = build_user(
        String::from("foo@bar.com"), 
        String::from("user"),
    );

    let user2 = User {
        email: String::from("bar@bar.com"),
        ..user1
    };

    println!("{}", user2.username);

    let rect = Rectangle{width: dbg!(20*10), height:10};
    rect.idle();
    println!("{:?} > {}", rect, rect.area());
    dbg!(&rect);


    //invaild
    //println!("{} {}", user1.username, user2.username);

}
