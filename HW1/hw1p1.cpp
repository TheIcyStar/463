//Name: Alexander Petrov
//PSU account: aop5448

#include <iostream>
#include <algorithm>

int stocks_exhaustive(int prices[]);
int stocks_greedy(int prices[]);

struct pricePair {
  int index;
  int price;
};

struct { //Reference used: https://en.cppreference.com/w/cpp/algorithm/sort.html
  bool operator()(pricePair a, pricePair b) const { return a.price < b.price; }
} pricePairComparitor;

int main(void){
  int prices[] = {7,1,5,3,6,4};
  // int prices[] = {7,6,4,3,1};

  std::cout << "Exhaustive search result: \n" <<
               stocks_exhaustive(prices) << "\n";

  std::cout << "Greedy result: \n" <<
               stocks_exhaustive(prices) << "\n";

  return 0;
}

/**
 * Exhastively searches for the best price to sell with a simple nested for loop
 * @param prices Array of prices for each day
 * @return profit
 */
int stocks_exhaustive(int prices[]){
  int pricesLength = sizeof(prices) / sizeof(prices[0]);
  int bestBuy = -1;
  int bestSell = -1;
  int bestProfit = 0;

  for(int i=0; i < pricesLength; i++){
    for(int j=i; j < pricesLength; j++){
      if(prices[j] - prices[i] > bestProfit){
        bestBuy = i;
        bestSell = j;
        bestProfit = prices[j] - prices[i];
      }
    }
  }

  return bestProfit;
}

/**
 * Finds the best profit by picking the biggest price difference and checks if the buy/sell pair is valid.
 * If invalid, continues to the next biggest price difference and repeats.
 * @param prices Array of prices for each day
 * @return profit
 */
int stocks_greedy(int prices[]){
  // Add indexes to our price data, as indexes are lost after sorting
  int pricesLength = sizeof(prices) / sizeof(prices[0]);
  pricePair* pricePairs = new pricePair[pricesLength];

  for(int i=0; i < pricesLength; i++){
    pricePairs[i].index = i;
    pricePairs[i].price = prices[i];
  }

  //sort,
  std::sort(0, pricesLength, pricePairComparitor);

  /* Check the biggest difference pairs
  We can get the biggest pairs by putting all of the prices like this on a 2d matrix
  for example, with prices [1,3,4,5,6,7] and the price differences in each spot:

      __7___6___5___4___3___1
    1|  6   5   4   3   2   0
    3|  4   3   2   1   0
    4|  3   2   1   0
    5|  2   1   0
    6|  1   0
    7|  0

      _20__17__11___5___3___1   <-- Doesn't work for this, values all over the place
    1| 19  16  10   4   2   0
    3| 17  14   8   2   0
    5| 15  12   6   0
   11|  9   6   0
   17|  3   0
   20|  0
  */
}