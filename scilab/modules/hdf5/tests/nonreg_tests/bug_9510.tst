//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 9510 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=9510
//
// <-- Short Description -->
// export does not return %f when try to export unmanaged data types.
//

A = sparse( [ 2  3  0  0  0;
3  0  4  0  6;
0 -1 -3  2  0;
0  0  1  0  0;
0  4  2  0  1] );
b = [8 ; 45; -3; 3; 19];
lusparse = umf_lufact(A);

err = execstr("save(TMPDIR + ""/lusparse.sod"",""lusparse"")", "errcatch");
assert_checktrue(err <> 0);
if ls(TMPDIR+"/lusparse.sod") <> [] then pause end
umf_ludel(lusparse);
