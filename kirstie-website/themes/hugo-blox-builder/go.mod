module github.com/HugoBlox/hugo-blox-builder

go 1.17

replace (
	github.com/HugoBlox/hugo-blox-builder/modules/blox-analytics => ./modules/blox-analytics
	github.com/HugoBlox/hugo-blox-builder/modules/blox-bootstrap => ./modules/blox-bootstrap
	github.com/HugoBlox/hugo-blox-builder/modules/blox-core => ./modules/blox-core
	github.com/HugoBlox/hugo-blox-builder/modules/blox-plugin-decap-cms => ./modules/blox-plugin-decap-cms
	github.com/HugoBlox/hugo-blox-builder/modules/blox-plugin-netlify => ./modules/blox-plugin-netlify
	github.com/HugoBlox/hugo-blox-builder/modules/blox-plugin-reveal => ./modules/blox-plugin-reveal
	github.com/HugoBlox/hugo-blox-builder/modules/blox-seo => ./modules/blox-seo
	github.com/HugoBlox/hugo-blox-builder/modules/blox-tailwind => ./modules/blox-tailwind
)
