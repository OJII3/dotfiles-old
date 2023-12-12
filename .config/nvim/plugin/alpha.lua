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
	[[                                                                                                              ..lodko.,lco:;,o0ko   .lc'...                      ]],
	[[                                                                                                               :oox:..xc,;;. ;00x    ;oc..                       ]],
	[[                      .'        ..                                                                          . ;dxxkd'lxxc;l. ,00O.   .lo'.                       ]],
	[[                    .,;,'.      .:;.                                           ;;.                         ..;l::;,;:lcdl,:c.;0Ok:    ;lc....  .                 ]],
	[[                   ;::;;,,'     .ccc:                                          ;;.                        ..,l';l:::oo:'.ldc;d0xdk    .co,..... .                ]],
	[[                   :::c;,,,,.   .cccc.    .'...',.   '...'.  .,'.',. ox;   .dx.dx, ox:odxc'ldxxl.         .'dx;kKxOKO;;:,:d:cxXx:O;    ,dc........               ]],
	[[                   cccc;,;;;,.  .llll.    .l     d .c     ;..c     ;:.kk.  dO' kO; xO:  ;OO'  oOc        ',kOdx0OKXXKx,.'ck000XOcxx    .lo'........              ]],
	[[                   cccc' .;;;;, 'llll.    .:     d.;:.....'.c'      d .kx lO:  kO; xO,  'OO.  cOl       '.oKk0c:xOk0kOOd0Oll;OXOdok,    :l,.......'.             ]],
	[[                   lccc,  .;;;;;;oooo.    .:     d..c       ';     .l  ;OdOo   kO; xO,  'OO.  cOl      '.'lokd,::,:dc:o:od;''KXkdlxx    ,l'........'             ]],
	[[                   llll,    ,:::clooo.    .;     o  .,'..''  .'...',    cdo    dx, ox'  .xx.  :xc     '.'odccc,....;. ...'';lxOkxddd    .c'........'             ]],
	[[                   clll,     '::clloo.                                                               ...lxdolk0Okxc,    lOOOO:.....     .;'..........            ]],
	[[                    .co,      .:cll,                                                                ...;xkkdoO0kkOc.    .OOkOk          .'''''.......            ]],
	[[                      .'        ;'                                                                 ....cdxkxdO0kkO,.     c0kO0,         '';:;,'......            ]],
	[[                                                                                                   ...,:lodxx0K00k'.     .000Ko        .',ooc:''.....            ]],
	[[                                                                                                  ....';:coxx0K00d;.      lKKKO.       .'ldoo:;'.....            ]],
	[[                                                                                                  ....',,;dxx00kOko'      .0kkO,      .,:dool:;'.. .             ]],
	[[                                                                                                  . .'''':xddK0xOl::       :OxOd      :clllccc:;...              ]],
	[[                                                                                                  ...'''':olxNKKx' ..       o00K:    ,dololccccc,,.              ]],
	[[                                                                                                  ..';,,,:ll0NXK'            lK0Xl   oxodddoodo:;.               ]],
	[[                                                                                                  .',cl::codKKKo              ;XXXl  ;:llooxxd;.                 ]],
	[[                                                                                                   .,ooodddoKKK'               ,KKK'  .'clloc'                   ]],
	[[                                                                                                     'lolcc.0KO                 :KKk    .,,.                     ]],
	[[                                                                                                       .',,.KKd                  oK0;    .                       ]],
	[[                                                                                                            O0d                   OOx.                           ]],
	[[                                                                                                            kkd,                  dxx:                           ]],
	[[                                                                                                            xdol.                :dlok                           ]],
	[[                                                                                                            :Oddl               .dodd:                           ]],
	[[                                                                                                             ...                  ...                            ]],
}

dashboard.config.opts.noautocmd = true

vim.cmd([[
  autocmd User AlphaReady echo 'Ready!'
]])

alpha.setup(dashboard.config)
