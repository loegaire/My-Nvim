#include <bits/stdc++.h>
using namespace std;using ll = long long; using vi = vector<int>; using vll = vector<ll>;
using pii = pair<int, int>; using pll = pair<ll, ll>;
const int MOD = 1e9 + 7; const ll INF = 1e18; const int MAXN = 2e5 + 5;
#define For(i, a, b) for (int i = (a); i < (b); ++i)
#define Rof(i, a, b) for (int i = (b) - 1; i >= (a); --i)
#define trav(a, x) for (auto& a : x)
#define pb push_back
#define mp make_pair
#define sz(x) (int)(x).size()
#define all(x) (x).begin(), (x).end()
#define rall(x) (x).rbegin(), (x).rend()
ll add(ll a, ll b, ll mod = MOD) { return (a + b) % mod; }
ll mul(ll a, ll b, ll mod = MOD) { return (a * b) % mod; }
ll pow_mod(ll a, ll b, ll mod = MOD) {
    ll res = 1;
    while (b) {
        if (b & 1) res = mul(res, a, mod);
        a = mul(a, a, mod);
        b >>= 1;
    }
    return res;
}
int solve();
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    solve();
    return 0;
}
int solve(){

}
