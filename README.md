Access violation repro

Using git latest:
- lib heaps
- lib hlsdl
- lib haxeui-core
- lib haxeui-heaps

Using haxe 5.0.0-alpha.1+f283deb

With Inkscape 1.1.2 (0a00cf5339, 2022-02-04)

On Ubuntu 22.04 

Note: Must comment https://github.com/HeapsIO/heaps/blob/master/hxd/fs/Convert.hx#L407 , as the registration of the converter doesn't seem to override 