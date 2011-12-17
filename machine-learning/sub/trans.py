# coding: utf-8
import os,sys,re,codecs

limit=[60,60,60,1000]
def xml2srt(fi,fo):
    data=''.join((fi.read().split('\n')[9:-4])).strip().split('</p>')
    for i in range(0,len(data)-1):
        #print i,data[i]
        if data[i]:
            st_st=data[i].index('"')
            st_ed=data[i].index('"',st_st+1)
            if i+1<len(data)-1:
                nx_st=data[i+1].index('"')
                nx_ed=data[i+1].index('"',nx_st+1)
            fo.write(str(i+1)+' \n')
            stamps=[data[i][st_st+1:st_ed],
                    data[i+1][nx_st+1:nx_ed] if i+1<len(data)-1 else "99:59:59.999"]
            word=data[i][data[i].index('>')+1:].replace('\n',' ')+' \n\n\n'
            for i,stamp in enumerate(stamps):
                stamp=stamp.split('.')
                stamps[i]=map(int,stamp[0].split(':'))
                stamps[i].append(int(stamp[1]))
            stamps=map(lambda s:"%02d:%02d:%02d,%03d" % tuple(s),stamps)
            fo.write("%s --> %s \n" % tuple(stamps))
            fo.write(word)
    #print 'OK!'

if __name__=='__main__':
    for fn in os.listdir('.'):
        if fn[-4:]!='.xml':
            continue
        print 'Converting:',fn[:-4]
        fi=file(fn,'r')
        if os.path.exists(fn[:-4]+'.srt'):
            continue
        fo=file(fn[:-4]+'.srt','w')
        xml2srt(fi,fo)
        fo.close()
        print 'Done'
