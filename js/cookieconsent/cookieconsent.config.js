window.CookieConsent.init({
  theme: {
    barColor: '#303030',
    barTextColor: '#FFF',
    barMainButtonColor: '#FFF',
    barMainButtonTextColor: '#312e2e',
    modalMainButtonColor: '#312e2e',
    modalMainButtonTextColor: '#FFF',
  },
  language: {
    current: window.language || 'en',
    locale: {
		en: {
			barMainText: 'This website uses cookies to ensure you get the best experience on our website.',
			barLinkSetting: 'Cookie Settings',
			barBtnAcceptAll: 'Accept all cookies',
			modalMainTitle: 'Cookie settings',
			modalMainText: 'Cookies are small piece of data sent from a website and stored on the user\'s computer by the user\'s web browser while the user is browsing. Your browser stores each message in a small file, called cookie. When you request another page from the server, your browser sends the cookie back to the server. Cookies were designed to be a reliable mechanism for websites to remember information or to record the user\'s browsing activity.',
			modalBtnSave: 'Save current settings',
			modalBtnAcceptAll: 'Accept all cookies and close',
			modalAffectedSolutions: 'Affected solutions:',
			learnMore: 'Learn More',
			on: 'On',
			off: 'Off',
		},
		es: {
			barMainText: 'Este sitio web utiliza cookies para asegurar que usted obtenga la mejor experiencia en nuestro sitio web.',
			barLinkSetting: 'Configuración',
			barBtnAcceptAll: 'Acceptar todas las cookies',
			modalMainTitle: 'Configuración de las Cookiees',
			modalMainText: 'Las cookies son pequeños datos enviados desde un sitio web y almacenados en el ordenador del usuario por el navegador web del usuario mientras éste navega. El navegador almacena cada mensaje en un pequeño archivo, llamado cookie. Cuando solicita otra página del servidor, su navegador envía la cookie de vuelta al servidor. Las cookies fueron diseñadas para ser un mecanismo confiable para que los sitios web recuerden información o registren la actividad de navegación del usuario.',
			modalBtnSave: 'Guardar',
			modalBtnAcceptAll: 'Acceptar todas y cerrar',
			modalAffectedSolutions: 'Soluciones afectadas:',
			learnMore: 'Saber más...',
			on: 'Activar',
			off: 'Desactivar',
		},
		sk: {
			barMainText: 'Pre zlepÅ¡ovanie vÃ¡Å¡ho zÃ¡Å¾itku na naÅ¡ich strÃ¡nkach pouÅ¾Ã­vame cookies.',
			barLinkSetting: 'Nastavenia cookies',
			barBtnAcceptAll: 'PrijÃ­maÅ¥ vÅ¡etky sÃºbory cookie',
			modalMainTitle: 'Nastavenia cookies',
			modalMainText: 'SÃºbory cookie sÃº malÃ© textovÃ© sÃºbory obsahujÃºce nÃ¡zov navÅ¡tÃ­venej strÃ¡nky, platnosÅ¥ a preddefinovanÃº hodnotu. UkladajÃº sa do prieÄinku vÃ¡Å¡ho prehliadaÄa. Pri opÃ¤tovnej nÃ¡vÅ¡teve webovej strÃ¡nky, ktorÃ¡ sÃºbor vytvorila, jej mÃ´Å¾u byÅ¥ prehliadaÄom znovu odoslanÃ©. Cookies, ktorÃ© pouÅ¾Ã­vame, nepoÅ¡kodzujÃº vÃ¡Å¡ poÄÃ­taÄ ani inÃ© zariadenia pouÅ¾Ã­vanÃ© na prehliadanie internetu.',
			modalBtnSave: 'UloÅ¾enie nastavenia',
			modalBtnAcceptAll: 'PrijÃ­maÅ¥ vÅ¡etky sÃºbory cookie a zatvoriÅ¥',
			modalAffectedSolutions: 'Na Äo budÃº maÅ¥ vplyv:',
			on: 'ZapnÃºÅ¥',
			off: 'VypnÃºÅ¥',
		}
    }
  },
  categories: {
    necessary: {
      needed: true,
      wanted: true,
      checked: true,
      language: {
        locale: {
			en: {
              name: 'Strictly Necessary Cookies for OJS',
              description: 'For the pupose of proper form handling and for the authentication of logged in users we need to use cookies.'
            },
			es: {
              name: 'Cookies imprescindibles para OJS',
              description: 'Para el correcto funcionamiento de OJS y para la autenticación de los usuarios registrados necesitamos usar cookies.'
            },
          sk: {
            name: 'PrÃ­sne potrebnÃ© sÃºbory cookie fur OJS',
            description: 'For the pupose of proper form handling and for the authentication of logged in users we use cookies.'
          }
        }
      }
    },
    analytics: {
      needed: false,
      wanted: false,
      checked: false,
      language: {
        locale: {
          en: {
            name: 'Analytics Cookies',
            description: 'To continuously improve our services we use exernal analytics solutions. We always use the maximum level of anonymization allowed on the 3rd party services.'
          },
          sk: {
            name: 'Analytics Cookies',
            description: 'To continuously improve our services we use exernal analytics solutions. We always use the maximum level of anonymization allowed on the 3rd party services.'
          }
        }
      }
    },
    social: {
      needed: false,
      wanted: false,
      checked: false,
      language: {
        locale: {
          en: {
            name: 'Social Cookies',
            description: 'For social sharing we use 3rd party services which are using cookies.',
          },
          sk: {
            name: 'Socialne mÃ©dia',
            description: 'Na poskytovanie podpory pre naÅ¡ich nÃ¡vÅ¡tevnÃ­kov pouÅ¾Ã­vame doplnok sociÃ¡lneho chatu. Tento doplnok potrebuje sÃºbory cookie na sprÃ¡vne fungovanie.',
          }
        }
      }
    }
  },
  services: {
	ojs: {
		category: 'social',
		type: 'localcookie', // dynamic-script, script-tag, wrapped, localcookie
		search: 'OJS',
		cookies: [
		{
			// Regex matching cookie name.
			name: /OJS-ReDi-da/,
			domain: `.${window.location.hostname}`
		}
		],
		language: {
			locale: {
				en: {
					name: 'OJS',
					}
				}
			}
		},
	hotjar: {
      category: 'analytics',
      type: 'dynamic-script',
      search: 'hotjar',
      language: {
        locale: {
          en: {
            name: 'Hotjar',
          }
        }
      }
    },
    analytics: {
      category: 'analytics',
      type: 'dynamic-script',
      search: 'analytics',
	  // List of known cookie names or Regular expressions matching
	  // cookie names placed by this service.
	  // These willbe removed from current domain and .domain.
	  cookies: [
		{
		  // Known cookie name.
		  name: '_gid',
		  // Expected cookie domain.
		  domain: `.${window.location.hostname}`
		},
		{
		  // Regex matching cookie name.
		  name: /^_ga/,
		  domain: `.${window.location.hostname}`
		}
	  ],
      language: {
        locale: {
          en: {
            name: 'Google Analytics',
          }
        }
      }
    },
	addtoany: {
      category: 'social',
      type: 'script-tag',
      search: 'addthis',
      language: {
        locale: {
          en: {
            name: 'AddThis',
          }
        }
      }
    },
	twitter: {
      category: 'social',
      type: 'script-tag',
      search: 'twitter',
      language: {
        locale: {
          en: {
            name: 'Twitter',
          }
        }
      }
    },
    facebook: {
      category: 'social',
      type: 'dynamic-script',
      search: 'facebook',
      language: {
        locale: {
          en: {
            name: 'Facebook',
          }
        }
      }
    }
  }
});

$(function() {
	$(".cc-text").append(' <a href="your_link">Learn  More</a>');
});
