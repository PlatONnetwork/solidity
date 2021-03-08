/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
// SPDX-License-Identifier: GPL-3.0
/** @file CommonData.cpp
 * @author Gav Wood <i@gavwood.com>
 * @date 2014
 */

#include <libsolutil/CommonData.h>
#include <libsolutil/Exceptions.h>
#include <libsolutil/Assertions.h>
#include <libsolutil/Keccak256.h>
#include <libsolutil/FixedHash.h>

#include <boost/algorithm/string.hpp>

using namespace std;
using namespace solidity;
using namespace solidity::util;

namespace
{

static char const* upperHexChars = "0123456789ABCDEF";
static char const* lowerHexChars = "0123456789abcdef";

}

string solidity::util::toHex(uint8_t _data, HexCase _case)
{
	assertThrow(_case != HexCase::Mixed, BadHexCase, "Mixed case can only be used for byte arrays.");

	char const* chars = _case == HexCase::Upper ? upperHexChars : lowerHexChars;

	return std::string{
		chars[(unsigned(_data) / 16) & 0xf],
		chars[unsigned(_data) & 0xf]
	};
}

string solidity::util::toHex(bytes const& _data, HexPrefix _prefix, HexCase _case)
{
	std::string ret(_data.size() * 2 + (_prefix == HexPrefix::Add ? 2 : 0), 0);

	size_t i = 0;
	if (_prefix == HexPrefix::Add)
	{
		ret[i++] = '0';
		ret[i++] = 'x';
	}

	// Mixed case will be handled inside the loop.
	char const* chars = _case == HexCase::Upper ? upperHexChars : lowerHexChars;
	size_t rix = _data.size() - 1;
	for (uint8_t c: _data)
	{
		// switch hex case every four hexchars
		if (_case == HexCase::Mixed)
			chars = (rix-- & 2) == 0 ? lowerHexChars : upperHexChars;

		ret[i++] = chars[(static_cast<size_t>(c) >> 4ul) & 0xfu];
		ret[i++] = chars[c & 0xfu];
	}
	assertThrow(i == ret.size(), Exception, "");

	return ret;
}

int solidity::util::fromHex(char _i, WhenError _throw)
{
	if (_i >= '0' && _i <= '9')
		return _i - '0';
	if (_i >= 'a' && _i <= 'f')
		return _i - 'a' + 10;
	if (_i >= 'A' && _i <= 'F')
		return _i - 'A' + 10;
	if (_throw == WhenError::Throw)
		assertThrow(false, BadHexCharacter, to_string(_i));
	else
		return -1;
}

bytes solidity::util::fromHex(std::string const& _s, WhenError _throw)
{
	if (_s.empty())
		return {};

	unsigned s = (_s.size() >= 2 && _s[0] == '0' && _s[1] == 'x') ? 2 : 0;
	std::vector<uint8_t> ret;
	ret.reserve((_s.size() - s + 1) / 2);

	if (_s.size() % 2)
	{
		int h = fromHex(_s[s++], _throw);
		if (h != -1)
			ret.push_back(static_cast<uint8_t>(h));
		else
			return bytes();
	}
	for (unsigned i = s; i < _s.size(); i += 2)
	{
		int h = fromHex(_s[i], _throw);
		int l = fromHex(_s[i + 1], _throw);
		if (h != -1 && l != -1)
			ret.push_back(static_cast<uint8_t>(h * 16 + l));
		else
			return bytes();
	}
	return ret;
}


bool solidity::util::passesAddressChecksum(string const& _str)
{
	if (_str.length() != 42)
		return false;

	pair<string,bytes> ret = bech32decode(boost::erase_all_copy(_str, "_"));
	string hrp = ret.first;
	if (hrp != "lat" && hrp != "lax") {
		return false;
	}
	return true;
}

bool solidity::util::isValidHex(string const& _string)
{
	if (_string.substr(0, 2) != "0x")
		return false;
	if (_string.find_first_not_of("0123456789abcdefABCDEF", 2) != string::npos)
		return false;
	return true;
}

bool solidity::util::isValidDecimal(string const& _string)
{
	if (_string.empty())
		return false;
	if (_string == "0")
		return true;
	// No leading zeros
	if (_string.front() == '0')
		return false;
	if (_string.find_first_not_of("0123456789") != string::npos)
		return false;
	return true;
}

/** The Bech32 character set for decoding. */
const int8_t charset_rev[128] = {
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    15, -1, 10, 17, 21, 20, 26, 30,  7,  5, -1, -1, -1, -1, -1, -1,
    -1, 29, -1, 24, 13, 25,  9,  8, 23, -1, 18, 22, 31, 27, 19, -1,
     1,  0,  3, 16, 11, 28, 12, 14,  6,  4,  2, -1, -1, -1, -1, -1,
    -1, 29, -1, 24, 13, 25,  9,  8, 23, -1, 18, 22, 31, 27, 19, -1,
     1,  0,  3, 16, 11, 28, 12, 14,  6,  4,  2, -1, -1, -1, -1, -1
};

/** Concatenate two byte arrays. */
bytes cat(bytes x, const bytes& y) {
    x.insert(x.end(), y.begin(), y.end());
    return x;
}

/** Find the polynomial with value coefficients mod the generator as 30-bit. */
uint32_t polymod(const bytes& values) {
    uint32_t chk = 1;
    for (size_t i = 0; i < values.size(); ++i) {
        uint8_t top = chk >> 25;
        chk = (chk & 0x1ffffff) << 5 ^ values[i] ^
            (-((top >> 0) & 1) & 0x3b6a57b2UL) ^
            (-((top >> 1) & 1) & 0x26508e6dUL) ^
            (-((top >> 2) & 1) & 0x1ea119faUL) ^
            (-((top >> 3) & 1) & 0x3d4233ddUL) ^
            (-((top >> 4) & 1) & 0x2a1462b3UL);
    }
    return chk;
}

/** Convert to lower case. */
unsigned char lc(unsigned char c) {
    return (c >= 'A' && c <= 'Z') ? (c - 'A') + 'a' : c;
}

/** Expand a HRP for use in checksum computation. */
bytes expand_hrp(const string& hrp) {
    bytes ret;
    ret.resize(hrp.size() * 2 + 1);
    for (size_t i = 0; i < hrp.size(); ++i) {
        unsigned char c = (unsigned char)hrp[i];
        ret[i] = c >> 5;
        ret[i + hrp.size() + 1] = c & 0x1f;
    }
    ret[hrp.size()] = 0;
    return ret;
}

/** Verify a checksum. */
bool verify_checksum(const string& hrp, const bytes& values) {
    return polymod(cat(expand_hrp(hrp), values)) == 1;
}

/** Create a checksum. */
bytes create_checksum(const string& hrp, const bytes& values) {
    bytes enc = cat(expand_hrp(hrp), values);
    enc.resize(enc.size() + 6);
    uint32_t mod = polymod(enc) ^ 1;
    bytes ret;
    ret.resize(6);
    for (size_t i = 0; i < 6; ++i) {
        ret[i] = (mod >> (5 * (5 - i))) & 31;
    }
    return ret;
}

/** Decode a Bech32 string. */
pair<string, bytes> solidity::util::bech32decode(const string& str) {
    bool lower = false, upper = false;
    bool ok = true;
    for (size_t i = 0; ok && i < str.size(); ++i) {
        unsigned char c = (unsigned char)str[i];
        if (c < 33 || c > 126) ok = false;
        if (c >= 'a' && c <= 'z') lower = true;
        if (c >= 'A' && c <= 'Z') upper = true;
    }
    if (lower && upper) ok = false;
    size_t pos = str.rfind('1');
    if (ok && str.size() <= 90 && pos != str.npos && pos >= 1 && pos + 7 <= str.size()) {
        bytes values;
        values.resize(str.size() - 1 - pos);
        for (size_t i = 0; i < str.size() - 1 - pos; ++i) {
            unsigned char c = (unsigned char)str[i + pos + 1];
            if (charset_rev[c] == -1) ok = false;
            values[i] = (unsigned char)charset_rev[c];
        }
        if (ok) {
            string hrp;
            for (size_t i = 0; i < pos; ++i) {
                hrp += (char)lc((unsigned char)str[i]);
            }
            if (verify_checksum(hrp, values)) {
                return make_pair(hrp, bytes(values.begin(), values.end() - 6));
            }
        }
    }
    return make_pair(string(), bytes());
}

/** Convert from one power-of-2 number base to another. */
template<int frombits, int tobits, bool pad>
bool convertbits(bytes& out, const bytes& in) {
    int acc = 0;
    int bits = 0;
    const int maxv = (1 << tobits) - 1;
    const int max_acc = (1 << (frombits + tobits - 1)) - 1;
    for (size_t i = 0; i < in.size(); ++i) {
        int value = in[i];
        acc = ((acc << frombits) | value) & max_acc;
        bits += frombits;
        while (bits >= tobits) {
            bits -= tobits;
            out.push_back((acc >> bits) & maxv);
        }
    }
    if (pad) {
        if (bits) out.push_back((acc << (tobits - bits)) & maxv);
    } else if (bits >= frombits || ((acc << (tobits - bits)) & maxv)) {
        return false;
    }
    return true;
}

/** Decode a bech32 address. */
bytes solidity::util::decodeAddress(const std::string& hrp, const std::string& addr) {
	pair<string, bytes> dec = solidity::util::bech32decode(addr);
    if (dec.first != hrp || dec.second.size() < 1) return bytes();
    bytes output;
	bool r = convertbits<5, 8, false>(output, dec.second);
    if (!r||output.size() < 2 || output.size() > 40 ) {
        return bytes();
    }
    return output;
}

string solidity::util::formatAsStringOrNumber(string const& _value)
{
	assertThrow(_value.length() <= 32, StringTooLong, "String to be formatted longer than 32 bytes.");

	for (auto const& c: _value)
		if (c <= 0x1f || c >= 0x7f || c == '"')
			return "0x" + h256(_value, h256::AlignLeft).hex();

	return escapeAndQuoteString(_value);
}


string solidity::util::escapeAndQuoteString(string const& _input)
{
	string out;

	for (char c: _input)
		if (c == '\\')
			out += "\\\\";
		else if (c == '"')
			out += "\\\"";
		else if (c == '\b')
			out += "\\b";
		else if (c == '\f')
			out += "\\f";
		else if (c == '\n')
			out += "\\n";
		else if (c == '\r')
			out += "\\r";
		else if (c == '\t')
			out += "\\t";
		else if (c == '\v')
			out += "\\v";
		else if (!isprint(c, locale::classic()))
		{
			ostringstream o;
			o << "\\x" << std::hex << setfill('0') << setw(2) << (unsigned)(unsigned char)(c);
			out += o.str();
		}
		else
			out += c;

	return "\"" + std::move(out) + "\"";
}
