#include <iostream>
#include <thread>
#include <future>
#include <functional>

template<typename T>
void get_future(std::promise<T>& p, T x){
	try{
		throw std::runtime_error("This is Exception");
	}
	catch(...){
		p.set_exception(std::current_exception());
	}
}

int main(){
	std::promise<std::string> p;
	std::future<std::string> f{p.get_future()};

	std::thread th(
		get_future<std::string>, 
		std::ref(p), 
		std::string{"Hello, World"}
	);
	f.wait();
	try{
		std::cout << f.get() << std::endl;
	}
	catch(const std::exception& e){
		std::cout << e.what() << std::endl;
	}

	th.join();

	return 0;
}
