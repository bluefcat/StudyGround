#include <iostream>
#include <future>
#include <vector>
#include <thread>

int worker(int x, int c){
	std::this_thread::sleep_for(
		std::chrono::milliseconds(x*1000 % (121))
	);
	return 2*x + c;
}

template<typename F, typename ...ARGS>
std::future<std::result_of_t<F(ARGS...)>> run_function(F&& f, ARGS&&... args){
	return std::async(std::launch::async, f, args...);
}

int main(){
	std::vector<std::future<int>> futures;

	for(int i = 0; i < 10; i ++){
		futures.emplace_back(run_function(worker, i, 10-i));
	}
	
	for(int i = 0; i < 10; i ++){
		std::cout << futures[i].get() << std::endl;
	}

	return 0;
}
