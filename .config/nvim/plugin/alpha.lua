local status, alpha = pcall(require, "alpha")
if not status then
	return
end

vim.api.nvim_set_hl(0, "CustomAlphaHeader", { fg = "#00ffff", bold = true })
vim.api.nvim_set_hl(0, "CustomAlphaFooter", { fg = "#00ffff", bold = true })
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {}
dashboard.section.header.opts.hl = "CustomAlphaHeader"
dashboard.section.buttons.val = {}
dashboard.section.footer.opts.hl = "CustomAlphaFooter"
dashboard.section.header.val = {
	[[                                                                                                                        ......:o'.                               ]],
	[[                                                                                                                     c:,,,;',cxxlc,                              ]],
	[[                                                                                                                    '',;,,...,dol::,                             ]],
	[[                                                                                                                   ,l''.'',;''00k;'''                            ]],
	[[                                                                                                                  .dc:cc.  ,;lkk,'....                           ]],
	[[                                                                                                                  'll;cc..  .ll.  '....                          ]],
	[[                                                                                                                 .':l,.,,.,:,'c.  ......                         ]],
	[[                                                                                                                ...',, .:dd,,'.    '.....                        ]],
	[[                                                                                                                ...'., 'llcc;.. .  .'.....                       ]],
	[[                                                                                                               ..',',;'':;,.;;. .  .;''....                      ]],
	[[                                                                                                               .'cc:xo,:d::;dxddo   ,:'.....                     ]],
	[[                                                                                                              ..lodko.,lco:;,o0ko   .lc'....                     ]],
	[[                                                                                                               :oox:..xc,;;. ;00x    ;oc..  .                    ]],
	[[                      .;        ;.                                                                          . ;dxxkd'lxxc;l. ,00O.   .lo'.   .                   ]],
	[[                    .,l,'.      ;l;.                                           ;;;                         ..;l::;,;:lcdl,:c.;0Ok:    ;lc....  ;                 ]],
	[[                   ;odl;,,'     ;bcc:                                                                     ..,l';l:::oo:'.ldc;d0xdk    .co,..... .                ]],
	[[                   cddl;,;:,.   ;bccc.    :l.:'',.   :'''l.  .:''':. ox;   .dx.dx, ox:odxc'ldxxl.         .'dx;kKxOKO;;:,:d:cxXx:O;    ,dc........               ]],
	[[                   cccl;,;:;,.  ;llll.    :d     b .c     ;..c     ;:.kk.  dO' kO; xO:  ;OO'  oOc        ',kOdx0OKXXKx,.'ck000XOcxx    .lo'........              ]],
	[[                   cccl; .;;;;, ;llll.    :l     d.;d.....d.c'      d .kx lO:  kO; xO,  'OO.  cOl      .'.oKk0c:xOk0kOOd0Oll;OXOdok,    :l,.......'.             ]],
	[[                   lccl;  .;;;;;;looo.    :l     d..c       ';     .l  ;OdOo   kO; xO,  'OO.  cOl     .'.'lokd,::,:dc:o:od;''KXkdlxx    ,l'........'             ]],
	[[                   llll,    ,:;:;ldoo.    :l     d  '':..:'  ''...''    cdo    dx, ox'  .xx.  :xc    .'.'odccc,....;. ...'';lxOkxddd    .c'........'             ]],
	[[                   clll;     '::;ldoo.                                                              .:..lxdo;k0Okx:,    l:OOO:.....     .;'..........            ]],
	[[                    .co;      .:;dl,                                                                :..;xkkd.O0kkOc.    .OOkOk          .'''''......;            ]],
	[[                      .;        ;'                                                                 ....cdxkxlO0kkO,.     c0kO0,         '';:;,'......            ]],
	[[                                                                                                   ;..,:lodx;0K00k'.     .000Ko        .',ooc:''....;            ]],
	[[                                                                                                  ....';:coxl0K00d;.      lKKKO.       .'ldoo:;'.....            ]],
	[[                                                                                                  ;...',,;d:x00kOko'      .0kkO,      .,:dool:;';. .             ]],
	[[                                                                                                  . .'''':x.dK0xOl::       :OxOd      :clllccc:;..;              ]],
	[[                                                                                                  ;..'''':o.xNKKx' ..       o00K:    ,dololccccc,,.              ]],
	[[                                                                                                  ..';,,,ld.0NXK'            lK0Xl   oxodddoodo:;.               ]],
	[[                                                                                                  .',cl::codKKKo              ;XXXl  ;:llooxxd;.                 ]],
	[[                                                                                                   .,ooodddoKKK'               ,KKK'  .'clloc'                   ]],
	[[                                                                                                     'lolcc.0KO                 :KKk    ;,,.                     ]],
	[[                                                                                                       .',,.KKd                  oK0;    ;                       ]],
	[[                                                                                                            O0d                   OOx.                           ]],
	[[                                                                                                            kkd,                  dxx:                           ]],
	[[                                                                                                            xdol.                :dlok                           ]],
	[[                                                                                                            :Oddl               .dodd:                           ]],
	[[                                                                                                             :;:                  :;:                            ]],
}

dashboard.config.opts.noautocmd = true

vim.cmd([[
  autocmd User AlphaReady echo 'Ready!'
]])

alpha.setup(dashboard.config)
