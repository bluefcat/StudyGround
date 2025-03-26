#include <iostream>
#include <thread>
#include <future>

template<typename T>
T get_future(T x){
	std::this_thread::sleep_for(std::chrono::seconds(10));
	return x;
}

int main(){
	std::future<int> f = std::async(
		std::launch::async, get_future<int>, 3
	);

	std::cout << f.get() << std::endl;
	return 0;
}
