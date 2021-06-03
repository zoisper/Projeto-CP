{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_Projeto_CP (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alef/.cabal/bin"
libdir     = "/home/alef/.cabal/lib/x86_64-linux-ghc-8.10.4/Projeto-CP-0.1.0.0-inplace-cp2021t"
dynlibdir  = "/home/alef/.cabal/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/alef/.cabal/share/x86_64-linux-ghc-8.10.4/Projeto-CP-0.1.0.0"
libexecdir = "/home/alef/.cabal/libexec/x86_64-linux-ghc-8.10.4/Projeto-CP-0.1.0.0"
sysconfdir = "/home/alef/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Projeto_CP_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Projeto_CP_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Projeto_CP_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Projeto_CP_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Projeto_CP_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Projeto_CP_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)