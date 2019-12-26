
deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'bananapi-m2-zero'
	name: 'Bananapi M2 Zero'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		instructions.CONNECT_AND_BOOT
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/bananapi-m2-zero/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/bananapi-m2-zero/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/bananapi-m2-zero/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'bananapi-m2-zero'
		image: 'resin-image-flasher'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-flasher-bananapi-m2-zero.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
