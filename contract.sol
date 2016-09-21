
//Sample contract
library Math {
    /// @dev Computes the modular exponential (x ** k) % m.
    function modExp(uint x, uint k, uint m) returns (uint r) {
        r = 1;
        for (uint s = 1; s <= k; s *= 2) {
            if (k & s != 0)
                r = mulmod(r, x, m);
            x = mulmod(x, x, m);
        }
    }
}
contract Sample{
	string a;
	struct Data{
		uint vote;
		uint b;
		uint r;
	}
	struct Ans{
		uint ans;
	}
	Data user1;
	Data user2;
	Data user3;
	Ans user4;
	/*function set(uint a,uint b,uint r){
		user1.vote=a;
		user2.vote=b;
		user3.vote=r;
	}*/
	function clear(uint id){
		delete user1;
	}
	function Hash()constant returns(string){
		bytes memory bytesString  = new bytes(32);
		var sum = value1 + value2;
		bytes32 data = (0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
		for (uint j=0; j<32; j++) {
            byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[j] = char;
            }
        }
        return string(bytesString);
	}
	uint value1;
	uint value2;
	uint public random_number;
	uint256 C1;
	uint256 C2;
	uint256 C3;

	function Sample(uint v) {
		value1 = 110;
		value2 = 220;
	}
	function set1(uint v) {
		value1 = v;
	}
	function set2(uint v) {
		value2 = v;
	}
	function get1() constant returns (uint) {
		return value1;
	}
	function get2() constant returns (uint) {
		return value2;
	}
	function add()constant returns(uint){
		var sum = value1 + value2;
		return sum;
		//return bytes32(sha3(sum));
	}
	function average()constant returns(uint){
		var tmp = (value1 + value2)/2;
		return tmp;
	}
	function splitInfo(){
		
	}
	// Exponential operation and modulus 
	function modExp(uint x, uint k, uint m) constant returns (uint r) {
        r = 1;
        for (uint s = 1; s <= k; s *= 2) {
            if (k & s != 0)
                r = mulmod(r, x, m);
            x = mulmod(x, x, m);
        }
		return r;
    }
	//Data encryption
	function encrypt(uint m) constant returns(uint256){
		uint256 n=66330307346824234612953699374322587237;
		uint256 n_sq=4399709672724165034121539827430201158572642269408832988456078641801475294169;
		uint256 g=66330307346824234612953699374322587238;
		uint256 rN=617835660102062561994457558853061402807148328547590787745847601400281843808;//rN=r^**N mod N**2
		//uint256 m=30;//First input initial value is given to 30
		/*user1.vote=m;
		user2.vote=m;
		user3.vote=m;*/
		//var rn_mod_nsq =mulmod(rN,n,n_sq); 
		uint256 tmp=modExp(g,m,n_sq);
		uint256 cipher=mulmod(tmp,rN,n_sq);
		return cipher;
	}

	//Data decryption
	function decrypt()constant returns(uint256){
        uint256 cipher=getC3();
		// cx = 701568775979383767184996825570540371312554485465938824847537854110230627203
		// cy = 785301891856704972375536092288019339817960642384286861949228106820179410598
		// cz = 365981438577224139520201406825631526595252958268088298905150342057150781095
		//uint256 cipher=785301891856704972375536092288019339817960642384286861949228106820179410598;//18 digits ok, 19 digits error!
		//var cipher=2871850562076737147;
		uint256 n_sq=4399709672724165034121539827430201158572642269408832988456078641801475294169;
		uint256 n=66330307346824234612953699374322587237;
		uint256 l=66330307346824234596638270224156388940;
		uint256 m=56367221661986372556022362563679367699;
		var x=modExp(cipher,l,n_sq)-1;
		var x_div_n=x/n;
		var plain = mulmod(x_div_n,m,n);

		return plain;
	}
	function setC1(uint256 c){
		C1=c;
	}
	function getC1()constant returns(uint256){
		return C1;
	}
	function setC2(uint256 c){
		C2=c;
	}
	function getC2()constant returns(uint256){
		return C2;
	}
	function setC3(uint256 c){
		C3=c;
	}
    function getC3()constant returns(uint256){
		return C3;
	}
	function cipherTextOperation(uint256 c1,uint256 c2)constant returns(uint256){
		uint256 n_sq=4399709672724165034121539827430201158572642269408832988456078641801475294169;
		//uint256 c11 = 701568775979383767184996825570540371312554485465938824847537854110230627203;
		//uint256 c22 = 785301891856704972375536092288019339817960642384286861949228106820179410598;
		uint256 c3=mulmod(c1,c2,n_sq);
		//setC3(c3);
		return c3;
	}

	function homomorphic()constant returns(uint256){
		uint256 n_sq=4399709672724165034121539827430201158572642269408832988456078641801475294169;
		uint256 cx = 701568775979383767184996825570540371312554485465938824847537854110230627203;
		uint256 cy = 785301891856704972375536092288019339817960642384286861949228106820179410598;
		uint256 cz = 365981438577224139520201406825631526595252958268088298905150342057150781095;
		uint256 homo=mulmod(cx,cy,n_sq);
		
		return homo;
	}
	
	function randomNumber()constant returns(uint){
		uint random_number = uint(block.blockhash(block.number-1))%100 + 1;
		return random_number;
	}
}

