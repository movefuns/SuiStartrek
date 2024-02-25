fetch(
	"https://artio-80085-faucet-api-cf.berachain.com/api/claim?address=0xcBb5d856265FF430F4F80f11Cc01F7ED8a410107",
	{
		headers: {
			accept: "*/*",
			"accept-language": "zh-CN,zh;q=0.9",
			authorization:
				"Bearer 0._dZI65iuucD5klqQDA8zrbMG_5RkD8DPIyT8PG9r3otkHw6OsyT0Z7iypSIsnr9n_Wy-Wj28YVs5DKoyHI6vonXH2VqT4QofgIUu3350YepE-iNmYRzmCzSHiUcSuIRuFFoEcXorOsduZ9bTphQeAZd-o3hLORE1T0cGcykdZQlBYUY-aNzn6wIIVwF6aPblaahKrvQlQm7E1W_L8OKk1rmDO__T6oa6C9lNvUJ3-seJIbukHd4tN8jT01DTBsy3I5z-SOfCFPX1hplqjwFufp0SLEQi3r0RbyzyVNnqydIfMBOWH3J9xMsOiMdoiFdxOX16tSHiw28-foIi_wNi7aBXdqICL42h-1d4i-iIeqnTyH2bjDkv5_5AwrDzRXQP0sJNoIDghG6LrKbOP0bn1plxF-T7intLhbHICCRdwSx9zfWXlJlUfVolmIHUL46XpZPqpiK1wo2UCzTzzH50kA.2cvtOYycZ9GgqgLPkNixLQ.3678f2e23d584ab041ee6396225c4570dd69a4939379e1508d91fae247fe6f14",
			"cache-control": "no-cache",
			"content-type": "text/plain;charset=UTF-8",
			pragma: "no-cache",
			"sec-ch-ua":
				'"Not_A Brand";v="8", "Chromium";v="120", "Google Chrome";v="120"',
			"sec-ch-ua-mobile": "?0",
			"sec-ch-ua-platform": '"Linux"',
			"sec-fetch-dest": "empty",
			"sec-fetch-mode": "cors",
			"sec-fetch-site": "same-site",
		},
		referrer: "https://artio.faucet.berachain.com/",
		referrerPolicy: "strict-origin-when-cross-origin",
		body: '{"address":"0xb09693643bcba3667e160dfbedfb5398d559d2b2"}',
		method: "POST",
		mode: "cors",
		credentials: "include",
	},
)
	.then((res) => {
		console.log("res: ", res);
	})
	.catch((err) => {
		console.error("err: ", err);
	});
