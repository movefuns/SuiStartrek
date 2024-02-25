(self.webpackChunk_N_E = self.webpackChunk_N_E || []).push([
	[1931],
	{
		74824: function (e, t, s) {
			Promise.resolve().then(s.bind(s, 8962)),
				Promise.resolve().then(s.bind(s, 98181)),
				Promise.resolve().then(s.t.bind(s, 5136, 23)),
				Promise.resolve().then(s.t.bind(s, 43040, 23));
		},
		8962: function (e, t, s) {
			"use strict";
			s.r(t),
				s.d(t, {
					default: function () {
						return k;
					},
				});
			var r = s(27573),
				a = s(7653),
				n = s(96072),
				i = s.n(n),
				l = s(2056),
				o = s.n(l),
				c = s(61937),
				d = s(72085),
				u = s(9743),
				x = s(2694),
				h = s(45955),
				m = s(46040),
				p = s(43627),
				f = s(78123);
			function v(e) {
				let { address: t, setAlert: s, setShowAlert: n } = e,
					[i, l] = a.useState(null),
					o = (0, a.useRef)(null),
					[d, u] = a.useState(!1);
				async function x(e) {
					if ((n(), !e)) {
						s("error");
						return;
					}
					try {
						let r = await fetch(
							"".concat(c.ao, "/api/claim?address=").concat((0, f.K)(t)),
							{
								method: "POST",
								headers: {
									Authorization: "Bearer ".concat(e),
								},
								body: JSON.stringify({
									address: (0, f.K)(t),
								}),
							},
						);
						200 === r.status
							? s("success")
							: 429 === r.status
							? s("destructive")
							: s("error");
					} catch (e) {
						s("error");
					}
				}
				return (
					(0, a.useEffect)(() => {
						let e = null,
							t = null,
							s = setInterval(() => {
								let s = document.querySelector(
									'input[name="cf-turnstile-response"]',
								);
								s &&
									s !== e &&
									((e = s),
									null == t || t.disconnect(),
									(t = new MutationObserver((t) => {
										for (let s of t)
											"attributes" === s.type &&
												"value" === s.attributeName &&
												l(e.value);
									})).observe(e, {
										attributes: !0,
										attributeFilter: ["value"],
									}));
							}, 1e3);
						return () => {
							clearInterval(s), null == t || t.disconnect();
						};
					}, []),
					(0, r.jsxs)("div", {
						children: [
							(0, r.jsx)("div", {
								className: (0, m.a)("cf-turnstile", i ? "hidden" : "block"),
								"data-sitekey": "0x4AAAAAAARdAuciFArKhVwt",
								"data-theme": "light",
								ref: o,
								"data-appearance": "execute",
							}),
							(0, r.jsx)(p.z, {
								disabled: !(0, h.U)(null != t ? t : "") || d,
								className: (0, m.a)("mb-4 w-full", i ? "block" : "hidden"),
								type: "submit",
								onClick: () => {
									u(!0), x(i);
								},
								children: "Drip Tokens",
							}),
						],
					})
				);
			}
			var g = s(34330),
				b = s.n(g),
				j = s(16588);
			let w = (e) =>
				(0, r.jsx)(r.Fragment, {
					children: e.children,
				});
			var N = b()(() => Promise.resolve(w), {
				ssr: !1,
				loading: () =>
					(0, r.jsx)("div", {
						style: {
							animation: "spin 3 1s linear",
							width: "18px",
							height: "18px",
						},
						children: (0, r.jsx)(j.$j, {
							size: 16,
							color: "white",
						}),
					}),
			});
			function y() {
				return (0, r.jsxs)("div", {
					className:
						"mx-2 inline-flex h-8 w-fit items-center gap-1 rounded bg-neutral-900 bg-opacity-30 px-2 py-1 font-medium",
					children: [
						(0, r.jsx)(j.T1, {
							address: c.uh,
							fetch: !0,
						}),
						"BERA",
					],
				});
			}
			function k() {
				let [e, t] = a.useState(""),
					[s, n] = a.useState(void 0),
					[l, m] = a.useState(!1),
					[p, f] = a.useState(null);
				return (0, r.jsxs)("div", {
					className:
						"flex w-full max-w-[600px] flex-col gap-8 text-stone-50 xl:max-w-[473px]",
					children: [
						(0, r.jsxs)("div", {
							className:
								"items-center justify-between text-center sm:flex sm:text-left",
							children: [
								(0, r.jsxs)("div", {
									className: "flex flex-col gap-4",
									children: [
										(0, r.jsxs)("div", {
											className: "leading-12 w-full text-5xl font-bold",
											children: [
												"Bootstrap Your",
												(0, r.jsx)("br", {}),
												" Testnet Wallet",
											],
										}),
										(0, r.jsxs)("div", {
											className: "items-center text-lg font-semibold sm:flex",
											children: [
												" ",
												"Fund your testnet wallet with ",
												(0, r.jsx)(y, {}),
											],
										}),
									],
								}),
								(0, r.jsx)(i(), {
									src: "".concat(c.R6, "/faucet/faucet_v3_uktibg"),
									alt: "machine",
									width: 162,
									height: 198,
									loading: "eager",
									className: "hidden h-[198px] object-cover sm:block xl:hidden",
									unoptimized: !0,
								}),
							],
						}),
						(0, r.jsxs)("div", {
							className: "flex flex-col gap-1",
							children: [
								(0, r.jsxs)("div", {
									className: "h-7 text-sm font-medium",
									children: [
										"Wallet Address ",
										(0, r.jsx)("span", {
											className: "text-destructive-foreground",
											children: "*",
										}),
									],
								}),
								(0, r.jsxs)(N, {
									children: [
										(0, r.jsxs)("div", {
											className: "relative",
											children: [
												(0, r.jsx)(x.Input, {
													value: e,
													onChange: (e) => {
														t(e.target.value),
															!e.target.value || (0, h.U)(e.target.value)
																? f(null)
																: f("Please enter a valid address. ex: 0x..."),
															l && m(!1),
															n(void 0);
													},
												}),
												(0, r.jsx)(u.P.close, {
													className:
														"absolute right-3 top-3 h-4 w-4 cursor-pointer text-muted-foreground",
													onClick: () => {
														t(""), f(null), l && m(!1), n(void 0);
													},
												}),
											],
										}),
										p &&
											(0, r.jsx)(d.Alert, {
												variant: "destructive",
												children: (0, r.jsxs)(d.AlertTitle, {
													className: "align-center flex gap-1",
													children: [
														(0, r.jsx)(u.P.alertCircle, {
															className: "inline-block h-4 w-4",
														}),
														p,
													],
												}),
											}),
									],
								}),
							],
						}),
						l &&
							"success" === s &&
							(0, r.jsxs)(d.Alert, {
								variant: "success",
								children: [
									(0, r.jsxs)(d.AlertTitle, {
										children: [
											(0, r.jsx)(u.P.checkCircle, {
												className: "inline-block h-4 w-4",
											}),
											" Request Submitted",
										],
									}),
									(0, r.jsxs)(d.AlertDescription, {
										children: [
											"You’ll receive the testnet tokens in your wallet in about 2 minutes. Use your BERA to acquire a basket of other tokens from our",
											" ",
											(0, r.jsx)(o(), {
												href: c.gs,
												target: "_blank",
												className: "cursor-pointer underline",
												children: "DEX",
											}),
											".",
										],
									}),
								],
							}),
						l &&
							"destructive" === s &&
							(0, r.jsxs)(d.Alert, {
								variant: "destructive",
								children: [
									(0, r.jsxs)(d.AlertTitle, {
										children: [
											" ",
											(0, r.jsx)(u.P.info, {
												className: "inline-block h-4 w-4",
											}),
											" Wallet Grey-listed for 8 hours",
										],
									}),
									(0, r.jsx)(d.AlertDescription, {
										children:
											"To ensure a sufficient balance for all users, the Faucet is set to dispense testnet tokens every 8 hours. Please retry in 8 hours.",
									}),
								],
							}),
						l &&
							"error" === s &&
							(0, r.jsxs)(d.Alert, {
								variant: "destructive",
								children: [
									(0, r.jsxs)(d.AlertTitle, {
										children: [
											" ",
											(0, r.jsx)(u.P.XOctagon, {
												className: "inline-block h-4 w-4",
											}),
											" Oh no!",
										],
									}),
									(0, r.jsx)(d.AlertDescription, {
										children:
											"We are currently experiencing high traffic, causing temporary unavailability of our service. Please try again in a few minutes. We apologize for any inconvenience and appreciate your patience.",
									}),
								],
							}),
						(0, r.jsx)(v, {
							address: e,
							setAlert: n,
							setShowAlert: () => m(!0),
						}),
						(0, r.jsx)("hr", {}),
						(0, r.jsxs)("div", {
							className:
								"leading-12 text-center text-sm opacity-70 sm:text-start",
							children: [
								"To ensure a sufficient balance for all users, the Faucet is set to dispense ",
								"0.1",
								" testnet BERA tokens every ",
								"8",
								" hours.",
							],
						}),
					],
				});
			}
		},
		98181: function (e, t, s) {
			"use strict";
			s.r(t),
				s.d(t, {
					Explore: function () {
						return l;
					},
				});
			var r = s(27573),
				a = s(61937),
				n = s(43627),
				i = s(9743);
			let l = () =>
					(0, r.jsxs)("div", {
						id: "dapps",
						className: "mt-20 flex flex-col gap-6 text-center",
						children: [
							(0, r.jsx)("div", {
								className: "leading-12 text-5xl font-bold text-background",
								children: "Explore Berachain",
							}),
							(0, r.jsx)("div", {
								className:
									"text-centertext-lg mb-2 font-semibold leading-7 text-background",
								children: "Utilize our Defi primitives",
							}),
							(0, r.jsx)("div", {
								className:
									"mx-auto grid w-fit grid-cols-1 gap-6 lg:grid-cols-2 xl:grid-cols-3",
								children: o.map((e, t) =>
									(0, r.jsxs)(
										"div",
										{
											className:
												"mx-auto flex w-full max-w-[360px] flex-col items-center gap-4 rounded-md bg-background p-6",
											children: [
												e.icon,
												(0, r.jsxs)("div", {
													children: [
														(0, r.jsx)("div", {
															className: "text-3xl font-semibold leading-9",
															children: e.name,
														}),
														(0, r.jsx)("div", {
															className: "font-medium ",
															children: e.subtitle,
														}),
													],
												}),
												(0, r.jsx)("div", {
													className:
														"text-center text-sm leading-5 text-muted-foreground",
													children: e.description,
												}),
												(0, r.jsxs)("div", {
													className: "flex w-full justify-between gap-2",
													children: [
														(0, r.jsxs)(n.z, {
															onClick: () => window.open(e.goto),
															children: [
																"Go To App ",
																(0, r.jsx)(i.P.arrowRight, {}),
															],
														}),
														(0, r.jsxs)(n.z, {
															variant: "outline",
															disabled: !e.learnMore,
															onClick: () => window.open(e.learnMore),
															children: [
																"Learn More ",
																(0, r.jsx)(i.P.arrowRight, {}),
															],
														}),
													],
												}),
											],
										},
										t,
									),
								),
							}),
						],
					}),
				o = [
					{
						icon: (0, r.jsx)(i.P.bexFav, {
							className: "h-[52px] w-[52px]",
						}),
						name: a.rd,
						subtitle: "Berachain’s Dex",
						description:
							"Swap a variety of tokens effortlessly on our decentralized platform. Provide liquidity to pools and earn BGT rewards.",
						goto: a.gs,
						learnMore: "".concat(a.fW, "/learn/bex"),
					},
					{
						icon: (0, r.jsx)(i.P.honeyFav, {
							className: "h-[52px] w-[52px]",
						}),
						name: a.FM,
						subtitle: "Berachain’s Native Stablecoin",
						description:
							"A stablecoin that's integral to the Berachain ecosystem. Utilize HONEY for seamless trading, ensuring value consistency.",
						goto: a.BD,
						learnMore: "".concat(a.fW, "/learn/protocol/honey-stablecoin"),
					},
					{
						icon: (0, r.jsx)(i.P.bendFav, {
							className: "h-[52px] w-[52px]",
						}),
						name: a.RO,
						subtitle: "Supply Assets & Borrow HONEY",
						description:
							"Supply assets and unlock the potential to borrow HONEY. Earn BGT rewards while you supply and borrow.",
						goto: a.$8,
						learnMore: a.ss,
					},
					{
						icon: (0, r.jsx)(i.P.berpsFav, {
							className: "h-[52px] w-[52px]",
						}),
						name: a.Nb,
						subtitle: "Trade Your Favourite Pairs",
						description:
							"Experience the thrill of high leverage trading, tailored for both novices and seasoned traders. With an impressive 100x leverage.",
						goto: a.wE,
						learnMore: a.Kq,
					},
					{
						icon: (0, r.jsx)(i.P.bgtFav, {
							className: "h-[52px] w-[52px]",
						}),
						name: a.f,
						subtitle: "The Hub for BGT Governance",
						description:
							"Engage directly in the governance of BGT, leverage BGT Station for innovative bribe mechanisms, enhancing participation.",
						goto: a.Vo,
						learnMore: "".concat(a.fW, "/learn/protocol/bgt-station"),
					},
					{
						icon: (0, r.jsx)(i.P.berascanFav, {
							className: "h-[52px] w-[52px]",
						}),
						name: a.h7,
						subtitle: "Berachain's block explorer",
						description:
							"A complete guide to the Berachain Network. View all transactions and get detailed blockchain info with ease.",
						goto: a.Qb,
						learnMore: "".concat(a.fW, "/developers/beratrail-block-explorer"),
					},
				];
		},
	},
	function (e) {
		e.O(0, [4310, 4901, 6942, 4998, 1293, 4016, 1744], function () {
			return e((e.s = 74824));
		}),
			(_N_E = e.O());
	},
]);
