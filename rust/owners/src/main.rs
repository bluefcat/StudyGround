fn main() {
    {
        let s = "hello";
        println!("{s}");
    } // s is invaild
    
    {
        let mut s = String::from("Hello");
        s.push_str(", World!");
        println!("{s}");
    } // drop s
    
    {
        let s1 = String::from("Hello");
        let s2 = s1; //s1 and s2 has diffrent heap memory location.
                     //but literal "Hello" is location same.(maybe heap)

        //println!("{s1}, World!"); ownership move and s1 invaild
        println!("{s2}");
        let s3 = s2.clone();
        println!("{s2} {s3}");
    }

    {
        let s = String::from("Hello");
        takes_owner(s);
        //println!("{s}") invaild
    }

    {
        let s1 = String::from("Hello");
        let s2 = move_owner(s1);
        println!("{s2}");
    }

    {
        let s1 = String::from("Hello");
        let l = borrow_owner(&s1);
        println!("{s1} {l}");
        
        let mut s2 = String::from("Hello");
        change(&mut s2);
        println!("{s2}");
    }
}

fn takes_owner(x: String){
    println!("{}", x);
} // x is invaild

fn move_owner(x: String) -> String{
    x
}

fn borrow_owner(x: &String) -> usize{
    x.len()
}

fn change(x: &mut String){
    x.push_str(", World!");
}
